/*

    Test of cmp, csel, eq, ne, gt, lt
    Luis Espino 2024

    output:
    0-1-0-1

*/

.global _start

.data
out: .ascii " - - - \n"

.text
_start:
    ldr x1, =out            // load output

    mov w3, 2               // first operand
    mov w4, 3               // second operand

    mov w5, 1               // true
    mov x6, 0               // false
    
    cmp w3, w4

    csel w7, w5, w6, eq     // if cmp.eq 1 else 0
    add w7, w7, 48
    strb w7, [x1]           // store 0

    csel w7, w5, w6, ne     // if cmp.ne 1 else 0
    add w7, w7, 48
    strb w7, [x1, 2]        // store 1

    csel w7, w5, w6, gt     // if cmp.gt 1 else 0
    add w7, w7, 48
    strb w7, [x1, 4]        // store 0

    csel w7, w5, w6, lt     // if cmp.lt 1 else 0
    add w7, w7, 48
    strb w7, [x1, 6]        // store 1

    mov x0, 1
    mov x2, 8
    mov x8, 64
    svc 0

    mov x0, 0
    mov x8, 93
    svc 0
