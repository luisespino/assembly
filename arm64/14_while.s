/* 
    Multiplication with sums
    
    Luis Espino 2024

    Example: 3*2 = 6
    Execution: ./14_while ; echo $?
*/

.global _start

_start:
    //  initilization
    mov x0, 0
    mov x1, 3
    mov x2, 2

    // while x2!=0
while: 
    cmp x2, 0
    beq end
    add x0, x0, x1
    sub x2, x2, 1
    b while
end:
    mov x8, 93
    svc 0

