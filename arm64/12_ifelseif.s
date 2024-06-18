/* 
    Print if a number is positive,
    negative o neutral
    Luis Espino 2024
*/

.global _start

.data
pos: .ascii "The number is positive\n"
neg: .ascii "The number is negative\n"
neu: .ascii "The number is neutral\n"

.text
_start:
    mov x0, 15      // number to test

if:                 
    cmp x0, 0       
    blt elseif      // b to elseif if neg
    beq else        // b to else if neutral
    
    mov x0, 1       // print positive msg
    ldr x1, =pos
    mov x2, 23
    mov x8, 64
    svc 0
    b endif

elseif:
    mov x0, 1       // print negative msg
    ldr x1, =neg
    mov x2, 23
    mov x8, 64
    svc 0
    b endif

else:
    mov x0, 1       // print nneutral msg
    ldr x1, =neu
    mov x2, 22
    mov x8, 64
    svc 0

endif:
    mov x0, 0       // exit
    mov x8, 93
    svc 0
