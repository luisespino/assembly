.global _start

_start:
    li a0, 10           # a0 = 10
    li a1, 5            # a1 = 5
if:
    blt a0, a1, end     # if a0 < a1 goto end
    add a0, a0, a1      # a0 += a1
end:
    li a7, 93           # exit
    ecall
