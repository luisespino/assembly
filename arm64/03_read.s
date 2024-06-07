.global _start

_start:
    mov x0, 1       // set stdout
    ldr x1, =msg    // load msg
    mov x2, 18      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // generic syscall

    mov x0, 0       // set stdin
    ldr x1, =buf    // load buffer
    mov x2, 16      // size buffer
    mov x8, 63      // read syscall_num
    svc 0           // generic syscall

    mov x0, 1       // set stdout
    ldr x1, =buf    // load buffer
    mov x8, 64      // write syscall_num
    svc 0           // generic syscall

    mov x0, 0       // return value
    mov x8, 93      // exit syscal_num
    svc 0           // generic syscall

.data
msg:
    .ascii "Enter a text: "

.bss
buf:
    .space 16
