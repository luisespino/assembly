/* 
    Print when number is natural
    Luis Espino 2024
*/

.global _start

.data
msg: .ascii "The number is natural\n"

.text
_start:
    mov x0, 15      // number to test

if:                 
    cmp x0, 0       
    blt endif       // b to endif if x0<0
    
    mov x0, 1       // print msg
    ldr x1, =msg
    mov x2, 22
    mov x8, 64
    svc 0

endif:
    mov x0, 0       // exit
    mov x8, 93
    svc 0
