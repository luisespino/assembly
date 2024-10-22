.global _start

_start:
	jal fun
	
	li a7, 93
	ecall

fun:
	addi sp, sp, -4
	sw ra, (sp)
	addi sp, sp, 4
	li a0, 10
	ret