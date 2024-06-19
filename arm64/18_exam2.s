.global _start

.data
x: .asciz "Enter a number: "

.bss
y: .space 11
z: .space 34 

.text
_start:
    mov x0, 1
    ldr x1, =x
    mov x2, 22
    mov x8, 64
    svc 0
    mov x0, 0
    ldr x1, =y
    mov x2, 11
    mov x8, 63
    svc 0
    mov x0, 0
    ldr x1, =y
    mov x2, 10
    mov x3, 0
loop1:
    ldrb w3, [x1]
    cmp w3, 10
    beq endloop1
    sub w3, w3, 48
    uxtb x3, w3
    mul x0, x0, x2
    add x0, x0, x3
    add x1, x1, 1
    b loop1
endloop1:
    mov x1, 2
    mov x2, 0
    mov x3, x0
loop2:
    udiv x3, x3, x1
    add x2, x2, 1
    cmp x3, 0
    bne loop2
endloop2:
    ldr x1, =z
    mov x3, 2
    add x1, x1, x2
    add x1, x1, 1
    mov w4, 0
    strb w4, [x1]
    sub x1, x1, 1
    mov x4, 10
    strb w4, [x1]
    sub x1, x1, 1
loop3:
    udiv x4, x0, x3
    msub x5, x4, x3, x0
    add w5, w5, 48
    strb w5, [x1]
    sub x1, x1, 1
    mov x0, x4
    cmp x0, 0
    bne loop3
endloop3:
    mov x0, 1
    add x1, x1, 1
    mov x2, 34
    mov x8, 64
    svc 0
    mov x8, 93
    svc 0

