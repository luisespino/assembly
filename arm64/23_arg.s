/*
	Print argv[1]
	Luis Espino 2024
*/

.global _start

.bss
arg1: .space 32

.text
_start:
	ldr x0, [sp, 16]		// argv[1] address
	ldr x1, =arg1
	mov x2, 0
loop:						// read argv[1]
	ldrb w3, [x0, x2]
	cmp w3, 0
	beq end	
	strb w3, [x1, x2]
	add x2, x2, 1
	b loop
end:
	mov w0, 10				// add enter and eof
	strb w0, [x1, x2]
	add x2, x2, 1
	mov w0, 0
	strb w0, [x1, x2]

	mov x0, 1				// print argv[1]
	mov x2, 32
	mov x8, 64
	svc 0
	
  	mov x8, 93    			// exit
  	svc 0

