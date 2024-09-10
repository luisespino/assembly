.global _start

.text
_start:
	li t0, 32			# load number to multiply 32
	li t1, 2			# load base of power 2
	sll a0, t0, t1		# a0 = 32 x 4
	
	li a7, 93			# exit
	ecall
