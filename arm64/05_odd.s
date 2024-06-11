/*

    Print if digit is odd or even
    Luis Espino 2024

    output:
    [print 1-odd or 0-even from stdin]

*/

.global _start

.data
msg:
    .ascii "Enter 1 digit: "

.bss
input: .space 2

.text
_start:
    mov x0, 1       // stdout
    ldr x1, =msg    // load msg
    mov x2, 15      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 2       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    ldr x0, =input  // load input
    ldrb w1, [x0]   // load 1st digit
    sub w1, w1, 48  // ascii to num
    and w2, w1, 1   // check parity  
    add w2, w2, 48  // num to ascii
    strb w2, [x0]   // store 1-odd 0-even
    
    mov x0, 1       // stdout
    ldr x1, =input  // load msg
    mov x2, 2       // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall

    mov x0, 0       // return value
    mov x8, 93      // exit syscal_num
    svc 0           // syscall
