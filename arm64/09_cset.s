/*

    Test of cmp, cset, eq, ne, ge, le
    Luis Espino 2024

    output:
    1-0-1-1

*/

.global _start

.data
out: .ascii " - - - \n"

.text
_start:
    ldr x1, =out            // load output

    mov w3, 'a'             // first operand
    mov w4, 'a'             // second operand
    
    cmp w3, w4

    cset w7, eq             // if cmp.eq 1 else 0
    add w7, w7, 48
    strb w7, [x1]           // store 1

    cset w7, ne             // if cmp.ne 1 else 0
    add w7, w7, 48
    strb w7, [x1, 2]        // store 0

    cset w7, ge             // if cmp.gt 1 else 0
    add w7, w7, 48
    strb w7, [x1, 4]        // store 1

    cset w7, le             // if cmp.lt 1 else 0
    add w7, w7, 48
    strb w7, [x1, 6]        // store 1

    mov x0, 1
    mov x2, 8
    mov x8, 64
    svc 0

    mov x0, 0
    mov x8, 93
    svc 0
