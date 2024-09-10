.global _start

.text
_start:
	li t0, -180     # load number -180
	neg a0, t0      # calculate the two's complement
	
	li a7, 93       # exit
	ecall