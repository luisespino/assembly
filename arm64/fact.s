/* 
    factorial function 
    arguments:
        x0 number
    return value:
        x0 factorial(number)
    Luis Espino 2024
*/

.global factorial

factorial:
    // initialization
	mov x9, x0          // number
    mov x10, 1          // neutral value


    // iterative multiplication
loop: 
    cbz x9, end_loop    // if num == 0 end
    mul x10, x10, x9    // 2i num *= (num-1)
    add x9, x9, -1      // num--
    b loop

end_loop:
    mov x0, x10         // factorial(number)
    ret
