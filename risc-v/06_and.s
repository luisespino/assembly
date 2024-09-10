.global _start

.text
_start:
	li t0, 0xFFEEDDCC	# load number to clean
	li t1, 0x000000FF	# mask to clean left 6 hex
	and a0, t0, t1		# clean and set in a0
	
	li a7, 93		    # exit
	ecall