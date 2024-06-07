.global _start

_start:
	mov x0, 1	    // set stdout
	ldr x1, =msg	// load msg
	mov x2, 14	    // size msg
	mov x8, 64	    // write syscall_num
	svc 0		    // generic syscall
	
	mov x0, 0	    // return value
	mov x8, 93	    // exit syscall_num
	svc 0		    // generic syscall

.data 
msg: .asciz "Hello, World!\n"
