/*
    Return the array sum
    Luis Espino 2024
*/

.global _start

.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array_size = 10

.text
_start:
    mov x0, 0                   // result
    mov x1, 0                   // index
    ldr x2, =array              // load array

sum:
    cmp x1, array_size          // size comparison
    bge end                     // if x1 >= array_size end
    
    ldr x3, [x2]                // load next element
    add x0, x0, x3              // sum element
    add x2, x2, 4               // next 4 bytes
    add x1, x1, 1               // index++
    b sum
    
end:
    // exit
    mov x8, 93
    svc 0
    
