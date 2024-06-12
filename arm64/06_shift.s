/*

    Test asr, lsr, lsl, ror
    Luis Espino 2024

*/

.global _start

.data
out: .ascii " - - - \n"

.text
_start:
    ldr x1, =out        // load output

    mov w0, 0b1001      // 9 = 1001
    asr w0, w0, 2       // w0 >> 2
    add w0, w0, 48      // adjust ascii
    strb w0, [x1]       // store 2 = 0010

    mov w0, 0b10000     // 16 = 10000
    lsr w0, w0, 1       // w0 >> 1
    add w0, w0, 48      // adjust ascii
    strb w0, [x1, 2]    // store 8 = 01000

    mov w0, 0b010       // 2 = 010
    lsl w0, w0, 1       // w0 << 1
    add w0, w0, 48      // adjust ascii
    strb w0, [x1, 4]    // store 4 = 100

    mov x0, 0b0001      // 1
    ror x0, x0, 61      // ror 61
    add w0, w0, 48      // adjust ascii
    strb w0, [x1, 6]    // store 8 = 1000 

    mov x0, 1           // stdout
    mov x2, 8           // size
    mov x8, 64          // write
    svc 0               // syscall

    mov x0, x1          // return value
    mov x8, 93          // exit
    svc 0               // syscall
