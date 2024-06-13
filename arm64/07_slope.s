/*

    Slope of a line
    Luis Espino 2024

    [./07_sloscrpe ; echo $?]

*/

.global _start

_start:
    mov x0, 1           // x1
    mov x1, 2           // y1
    mov x3, 3           // x2
    mov x4, 4           // y2

    sub x5, x4, x1      // y2 - y1
    sub x6, x3, x0      // x2 - x1

    sdiv x0, x5, x6     // slope

    mov x8, 93          // exit
    svc 0               // syscall
