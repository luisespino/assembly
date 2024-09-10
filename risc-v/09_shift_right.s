.global _start

.text
_start:
	li t0, 07400    # load number to divide 3840
	srli a0, t0, 04 # a0 = 3840/16
	
	li a7, 93       # exit
	ecall