/* 
    Write|Create File
    Luis Espino 2024

*/

.global _start

.data
filename: .asciz "file.txt"
buffer: .asciz "Hello\nWorld!\n"
    
.text
_start:
    // open file
    mov x0, -100        // open
    ldr x1, =filename   // filename address
    mov x2, 101         // O_WRONLY | O_CREATE
    mov x3, 0777        // permissions
    mov x8, 56          // openat
    svc #0              // syscall
    mov x9, x0          // store file descriptor

    // write file
    mov x0, x9          // file descriptor
    ldr x1, =buffer     // buffer address
    mov x2, 14          // size address
    mov x8, 64          // write
    svc 0               // syscall

    // close file
    mov x0, x9          // file descriptor
    mov x8, 57          // close
    svc 0               // syscall

    // exit
    mov x0, 0           // return vale
    mov x8, 93          // exit
    svc 0               // syscall

