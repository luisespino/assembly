# Luis Espino 2024
# 
# Enter digits until 0

.global _start

.bss
buffer: .space 2            # no initialized

.text
_start:
do:                         # do
    li a0, 0
    la a1, buffer
    li a2, 2
    li a7, 63
    ecall
    la t0, buffer
    lb t1, (t0)
    addi t1, t1, -48
while:                      # while t1 != 0
    bnez t1, do
end:
    li a7, 93               # exit
    ecall