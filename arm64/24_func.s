/*
    Caller of factorial callee
    and itoa callee
    Luis Espino 2024
*/

.global _start

.extern factorial
.extern itoa

.data 
buffer: .space 11

.text
_start:
    mov x0, 5           // number
    bl factorial        // x0 = factorial(number)
    
    ldr x1, =buffer     // load buffer
    bl itoa             // buffer = itoa(x0)

    // print buffer
    mov x0, 1   
    ldr x1, =buffer
    mov x2, 11
    mov x8, 64
    svc 0

    // exit
    mov x8, 93
    svc 0
