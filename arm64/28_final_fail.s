// Ejemplo de árbol binario de búsqueda (BST) en ARM64 assembly

// Node structure definition
.equ NODE_SIZE, 16

.struct Node
    .int    value           // 4 bytes
    .int    left            // 4 bytes (pointer to left child Node)
    .int    right           // 4 bytes (pointer to right child Node)
.endstruct

// Static memory for nodes (enough for 10 nodes, for example)
.section .data
node_memory:
    .space NODE_SIZE * 10    // Space for 10 Node structures

// BST class definition
.struct BST
    .int    root            // 4 bytes (pointer to the root Node)
.endstruct

// Function to add a value to BST
.global add
add:
    // Arguments:
    // x0 - pointer to BST object
    // x1 - value to add

    ldr     x2, [x0, BST.root]      // Load root pointer
    cbz     x2, add_new_node        // If root is null, add new Node

add_loop:
    ldr     x3, [x2]                // Load Node pointer

    ldr     w4, [x3, Node.value]    // Load Node.value
    cmp     w1, w4                  // Compare value with Node.value

    blt     add_left                // Branch if value < Node.value

    // Value >= Node.value
    ldr     x3, [x3, Node.right]    // Load right child pointer
    cbz     x3, add_right_node      // If right child is null, add new Node

    // Move to the right child
    mov     x2, x3
    b       add_loop

add_left:
    ldr     x3, [x3, Node.left]     // Load left child pointer
    cbz     x3, add_left_node       // If left child is null, add new Node

    // Move to the left child
    mov     x2, x3
    b       add_loop

add_left_node:
    // Find next available slot in node_memory for left child
    ldr     x3, =node_memory        // Load base address of node_memory
    add     x3, x3, x2, lsl #2      // Calculate address for left child
    str     w1, [x3, Node.value]    // Store value in new Node
    str     x3, [x2, Node.left]     // Set left child pointer
    ret

add_right_node:
    // Find next available slot in node_memory for right child
    ldr     x3, =node_memory        // Load base address of node_memory
    add     x3, x3, x2, lsl #2      // Calculate address for right child
    str     w1, [x3, Node.value]    // Store value in new Node
    str     x3, [x2, Node.right]    // Set right child pointer
    ret

add_new_node:
    // Initialize root node (first node in node_memory)
    ldr     x2, =node_memory        // Load base address of node_memory
    str     x1, [x2, Node.value]    // Store value in new Node
    str     x2, [x0, BST.root]      // Set BST root pointer
    ret

// Entry point of the program
.global _start
_start:
    // Main program logic
    // Create BST instance
    ldr     x0, =bst_instance       // Load address of bst_instance
    bl      add                     // Add nodes to BST

    // Exit program
    mov     x8, #93                 // SYS_exit
    svc     #0                      // Exit syscall

// BST instance
.section .data
bst_instance:
    .space  NODE_SIZE               // Space for BST instance

// Data for adding nodes
.section .rodata
    .align  3                       // Align to 8-byte boundary
node_values:
    .int    25
    .int    10
    .int    35
    .int    5

// Code for adding nodes to BST
    ldr     x0, =bst_instance       // Load BST instance address
    ldr     x1, =node_values        // Load node values array address

    // Loop through node values array
    ldr     w2, [x1]                // Load first node value
    bl      add                     // Add first node
    add     x1, x1, #4              // Move to next node value

    ldr     w2, [x1]                // Load second node value
    bl      add                     // Add second node
    add     x1, x1, #4              // Move to next node value

    ldr     w2, [x1]                // Load third node value
    bl      add                     // Add third node
    add     x1, x1, #4              // Move to next node value

    ldr     w2, [x1]                // Load fourth node value
    bl      add                     // Add fourth node

    // End of program (_start)
    mov     x8, #93                 // SYS_exit
    svc     #0                      // Exit syscall
