.global _start

_start:
	li a0, 10
	li a1, 15
	jal max
	
	li a7, 93
	ecall
	
max:
	blt a0, a1, end
	ret
end:
    mv a0, a1
	ret