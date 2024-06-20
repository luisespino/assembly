/*  
    Alphabet generator loop using ASCII
    Luis Espino 2024
    
    output:
    abcdefghijklmnopqrstuvwxyz
*/

.global _start

_start:
	ldr x0, =str	// load str
	mov x1, 0	// counter = 0
	mov w3, #'a'	// first ascii

loop:
	strb w3, [x0]	// store ascii
	add w3, w3, #1	// next ascii
	add x1, x1, #1	// increment counter
	add x0, x0, #1 	// increment offset
	cmp x1, #26	    // counter comparison
	bne loop	    // goto loop

	mov w3, #10	    // new line
	strb w3, [x0]	// store new line

	mov x0, 1	    // stdout
	ldr x1, =str	// load str
	mov x2, 27	    // str size
	mov x8, 64	    // write syscall_num
	svc 0		    // syscall
	
	mov x0, 0       // return value
	mov x8, 93	    // exit syscall_num
	svc 0		    // syscall	

.data
str: .space 27
