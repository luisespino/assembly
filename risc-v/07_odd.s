.global _start

.text
_start:
	li t0, 33       # load number
	andi a0, t0, 1  # check paritity and set

	li a7, 93       # exit
	ecall