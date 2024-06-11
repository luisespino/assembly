/*

    Sum of digits in a string
    Luis Espino 2024

    output: (./04_sum ; echo $?)
    [the sum of digits in stdin]

*/

.global _start

.data
msg:
    .ascii "Enter 3 consecutive digits: "

.bss
input: 
    .space 4

.text
_start:
    mov x0, 1       // stdout
    ldr x1, =msg    // load msg
    mov x2, 28      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 4       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    ldr x0, =input  // load input
    ldrb w1, [x0]   // load 1st digit
    sub w1, w1, 48  // ascii to num
    add x0, x0, 1   // input offset
    ldrb w2, [x0]   // load 2nd digit
    sub w2, w2, 48  // ascii to num
    add x0, x0, 1   // input offset
    ldrb w3, [x0]   // load 3rd digit
    sub w3, w3, 48  // ascii to num
    add w4, w1, w2  // sum two digit
    add w4, w4, w3  // sum three digit

    uxtb x0, w4     // extend return value
    mov x8, 93      // exit syscal_num
    svc 0           // generic syscall
