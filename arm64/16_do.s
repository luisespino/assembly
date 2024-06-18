/* 
    Until press 0

    Luis Espino 2024

*/

.global _start

_start:
// do while w3 != 0
do:
    mov x0, 0
    ldr x1, =buffer
    mov x2, 2
    mov x8, 63
    svc 0
    ldrb w3, [x1]
    add w3, w3, -48
while:
    cmp w3, 0
    bne do
end:
    mov x8, 93
    svc 0

.data
buffer: .space 2
