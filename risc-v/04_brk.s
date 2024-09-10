.global _start

.data
ptr: .word 0        # pointer

.text
_start:
    li a7, 214      # brk syscall without arg
    ecall
    sw a0, ptr, t0  # ptr = data last address

    addi a0, a0, 4  # allocate 4 bytes more
    li a7, 214
    ecall

    la t0, ptr      # [ptr] = 100
    li t1, 100
    sw t1, (t0)

    la t0, ptr      # exit with a0 = [ptr]
    lw a0, (t0)
    li a7, 93
    ecall
