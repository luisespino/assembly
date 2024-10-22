.global _start

.data
buffer: .space 7

.text
_start:
	li a0, 15444
	lw a1, buffer
	jal itoa

	li a0, 1
	li a2, 7
	li a7, 64
	ecall
	
	li a7, 93
	ecall

itoa:
    # initialization
	mv t0, a0           # number
	mv t1, a1           # buffer
	li t2, 10           # base 10
	beqz t0, zero       # handle zero
	
	# count digits
	mv t3, a0
	li t4, 1
count:
	beqz t3, end_count
	div t3, t3, t2
	addi t4, t4, 1
	j count
end_count:
	add t1, t1, t4      # begin at end digits
    sb zero, (t1)	    # end of string
	addi t1, t1, -1
	li t5, 10           # new line
	sb t5, (t1)
	addi t1, t1, -1
	
	# put last digit in buffer
loop:	
	rem t3, t0, t2      # last digit
	addi t3, t3, '0'    # adjust ascii
	sb t3, (t1)         # store byte
	addi t1, t1, -1     # offset--
	div t0, t0, t2      # rm last digit
	bnez t0, loop
	ret

    # special case zero
zero:
	li t0, '0'          # zero value
	sb t0, 0(t1)
	li t0, 10           # new line
	sb t0, 1(t1)
	sb zero, 2(t1)	    # end of string
	ret