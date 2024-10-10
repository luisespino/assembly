.global _start

.data
negative: .string "It's negative !!!\n"
no_negative: .string "It's not negative\n"

.text
_start:
	li t0, -5              # test number
if:
	bltz t0, else          # if t0 < 0 goto else 
	la a1, no_negative     # if false
	beqz x0, end
else:                           
	la a1, negative        # if true
end:
	li a0, 1               # print
	li a2, 18
	li a7, 64
	ecall
	
	li a7, 93              # exit
	ecall

