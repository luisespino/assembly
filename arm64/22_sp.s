/*
    area = base x altura
    Luis Espino 2024
*/

.global _start

_start:
    sub sp, sp, 32      // 16B aligned
    mov x0, 0
    str x0, [sp]        // a = 0
    mov x0, 10
    str x0, [sp, 8]     // b = 10
    mov x0, 5
    str x0, [sp, 16]    // h = 5
    ldr x0, [sp, 8]
    ldr x1, [sp, 16]
    mul x0, x0, x1
    str x0, [sp]        // a = b x h
    ldr x0, [sp]        // return a
    add sp, sp, 32
    mov x8, 93
    svc 0

