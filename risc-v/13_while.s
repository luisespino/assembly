.global _start

_start:
    li a0, 0            # initilization
    li a1, 3
    li a2, 2
    
while:                  # while a2 != 0
    beqz a2, end
    add a0, a0, a1
    addi a2, a2, -1
    j while
end:
    li a7, 93           # exit
    ecall
    