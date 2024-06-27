.global _start

.data
a: .quad 7, 4, 3, 9, 1
b = 5

.bss
c: .space 11

.text
_start:
    ldr x0, =a
    mov x1, b
    bl func1

    ldr x0, =a
    mov x1, b
    ldr x2, =c
    bl func2

    mov x0, 1
    ldr x1, =c
    mov x2, 11
    mov x8, 64
    svc 0

    mov x8, 93
    svc 0

func1:
    mov x2, 0
    mov x3, 0
    mov x4, 0
l1:
    sub x5, x1, 1
    cmp x3, x5
    bge l2
    add x4, x3, 1
l3:
    cmp x4, x1
    bge l4
    lsl x19, x3, 3
    lsl x20, x4, 3
    add x19, x19, x0
    add x20, x20, x0
    ldr x21, [x19]
    ldr x22, [x20]
    cmp x21, x22
    ble l5
    ldr x23, [x19]
    ldr x24, [x20]
    str x24, [x19]
    str x23, [x20]
    add x2, x2, 1
l5:
    add x4, x4, 1
    b l3
l4:
    add x3, x3, 1
    b l1
l2: 
    ret


func2:
l6:
    cmp x1, 0
    beq l7
    ldr x3, [x0]
    add x3, x3, '0'
    strb w3, [x2]
    add x0, x0, 8
    add x2, x2, 1
    mov x3, ' '
    strb w3, [x2]
    add x2, x2, 1
    sub x1, x1, 1
    b l6
l7:
    mov x3, 10
    strb w3, [x2]
    strb wzr, [x2, 1]
    ret


 
