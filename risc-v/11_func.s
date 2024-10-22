.global _start

.data
msg1: .string "First message!!\n"
msg2: .string "Second message!\n"

.text
_start:
	la a1, msg1
	jal print

	la a1, msg2
	jal print

	li a7, 93
	ecall
	
print:
	li a0, 1
	li a2, 16
	li a7, 64
	ecall
	ret