.global _start

.data
msg: .string "Hello, world!\n"

.text
_start:
    li a0, 1       # load stdout number
	la a1, msg     # load msg address
	li a2, 14      # load msg size
	li a7, 64      # load write number
	ecall          # syscall

	li a7, 93      # load exit number
	ecall          # syscall
