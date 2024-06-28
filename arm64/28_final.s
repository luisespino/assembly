.global _start

.bss
memory: .space 240
offset: .quad 0 
buff_1: .space 22 
buff_2: .space 22
buff_3: .space 22

.text
_start:
    mov x0, 5
    ldr x1, =memory
    ldr x2, =offset
    bl func1

    mov x0, 7
    ldr x1, =memory
    ldr x2, =offset
    bl func1

    mov x0, 2
    ldr x1, =memory
    ldr x2, =offset
    bl func1
    
    mov x0, 4
    ldr x1, =memory
    ldr x2, =offset
    bl func1

    ldr x0, =memory
    ldr x1, =offset
    ldr x2, =buff_1
    bl func2

    mov x0, 1
    ldr x1, =buff_1
    mov x2, 22
    mov x8, 64
    svc 0

    ldr x0, =memory
    ldr x1, =buff_2
    bl func3
    
    mov x2, 10
    strb w2, [x1], 1
    strb wzr, [x1]
    mov x0, 1
    ldr x1, =buff_2
    mov x2, 22
    mov x8, 64
    svc 0

    ldr x0, =memory
    ldr x1, =buff_3
    bl func4
    
    mov x2, 10
    strb w2, [x1], 1
    strb wzr, [x1]
    mov x0, 1
    ldr x1, =buff_3
    mov x2, 22
    mov x8, 64
    svc 0

    mov x8, 93
    svc 0

func1:
    mov x3, x1
    ldr x4, [x2]
    cmp x4, 0
    beq l0
l1:
    ldr x5, [x3]
    cmp x0, x5
    bge l2
    ldr x6, [x3, 8]
    cmp x6, 0
    beq l3
    mov x3, x6
    b l1
l3:
    add x1, x1, x4
    str x1, [x3, 8]
    str x0, [x1]
    str xzr, [x1, 8]
    str xzr, [x1, 16]
    add x4, x4, 24
    str x4, [x2]
    ret
l2:
    ldr x6, [x3, 16]
    cmp x6, 0
    beq l4
    mov x3, x6
    b l1
l4:
    add x1, x1, x4
    str x1, [x3, 16]
    str x0, [x1]
    str xzr, [x1, 8]
    str xzr, [x1, 16]
    add x4, x4, 24
    str x4, [x2]
    ret
l0:
    str x0, [x1]
    str xzr, [x1, 8]
    str xzr, [x1, 16]
    add x4, x4, 24
    str x4, [x2]
    ret

func2:
    mov x9, 24
    ldr x10, [x1] 
    sdiv x10, x10, x9
l5:
    cmp x10, 0
    beq l6
    ldr x3, [x0]
    add x3, x3, '0'
    strb w3, [x2]
    add x0, x0, 24
    add x2, x2, 1
    mov x3, ' '
    strb w3, [x2]
    add x2, x2, 1
    sub x10, x10, 1
    b l5
l6:
    mov x3, 10
    strb w3, [x2]
    strb wzr, [x2, 1]
    ret

func3: 
    stp fp, lr, [sp, -16]!
    stp x0, x2, [sp, -16]!
    cbz x0, end_func3
    mov x2, x0
    ldr x0, [x0, 8]
    bl func3
    ldr x3, [x2]
    add x3, x3, '0'
    strb w3, [x1], 1
    mov x3, ' '
    strb w3, [x1], 1
    ldr x0, [x2, 16]
    bl func3 
end_func3:
    ldp x0, x2, [sp], 16
    ldp fp, lr, [sp], 16
    ret

func4: 
    stp fp, lr, [sp, -16]!
    stp x0, x2, [sp, -16]!
    cbz x0, end_func4
    ldr x3, [x0]
    add x3, x3, '0'
    strb w3, [x1], 1
    mov x3, ' '
    strb w3, [x1], 1
    mov x2, x0
    ldr x0, [x0, 8]
    bl func3
    ldr x0, [x2, 16]
    bl func3 
end_func4:
    ldp x0, x2, [sp], 16
    ldp fp, lr, [sp], 16
    ret

