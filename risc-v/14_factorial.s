.global _start

_start:
	li a0, 1
	li a1, 5
	jal fact
	
	li a7, 93
	ecall

fact:
	addi sp, sp, -4
	sw ra, (sp)
	li t0, 1
	beq a1, t0, end
	beq a1, zero, end
	mul a0, a0, a1
	addi a1, a1, -1
	jal fact
end:
	lw ra, (sp)
	addi sp, sp, 4
	ret