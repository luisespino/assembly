.global _start

_start:
    li a0, 0            # initilization
    li a1, 9
    li a2, 3

for:                    # for a1 >= 0
    blez a1, end
    addi a0, a0, 1
    sub a1, a1, a2
    j for
end:                    # a0 = a1 / a3
    li a7, 93           # exit
    ecall