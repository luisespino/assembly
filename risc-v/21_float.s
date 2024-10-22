.global _start

.data
factCF: .float 1.8
consCF: .float 32
celsius: .float 57

.text
_start:
	la t0, factCF
	flw f0, (t0)
	la t1, consCF
	flw f1, (t1) 
	la t2, celsius
	flw f2, (t2)
	fmul.s f2, f2, f0
	fadd.s f2, f2, f1
	fcvt.w.s a0, f2
	li a7, 93
	ecall