.global _start

.bss
buffer: .space 128

.text
_start:
	li a0, 0        # load stdin number
	la a1, buffer   # load buffer address
	li a2, 128      # load buffer size
	li a7, 63       # load read number
	ecall           # syscall

	li a0, 1        # load stdout number
	la a1, buffer   # load buffer address
	li a2, 128      # load buffer size
	li a7, 64       # load write number
	ecall           # syscall
	
	li a7, 93       # load exit number
	ecall           # syscall
