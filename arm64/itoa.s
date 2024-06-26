/* 
    itoa function 
    arguments:
        x0 number
        x1 address of buffer
    Luis Espino 2024
*/

.global itoa

itoa:
    // initialization
	mov x9, x0          // number
	mov x10, x1         // buffer
	mov x11, 10         // base 10
	cbz x9, zero        // handle zero
	
	// count digits
	mov x12, x9         // x9 saved
	mov x13, 1          // counter
count:
	cbz x12, end_count  // if x12==0 end
	udiv x12, x12, x11  // num = num / 10
	add x13, x13, 1     // counter++
	b count
end_count:
	add x10, x10, x13   // store at end digits
    strb wzr, [x10]     // '\0'
	add x10, x10, -1
	mov w14, 10         // '\n'
	strb w14, [x10]
	add x10, x10, -1    // ready to store number
	
	// put last digit in buffer
loop:
    udiv x12, x9, x11   // x12 = num / 10
    mul x13, x12, x11   // x13 = x12 * 10
    sub x13, x9, x13    // remainder
    add x13, x13, '0'   // ascii remainder
    strb w13, [x10]     // store ascii
    add x10, x10, -1    // offset --
    mov x9, x12         // num = num / 10
    cbnz x9, loop       // while num != 0
	ret

    // special case zero
zero:
    mov x9, '0'         // '0'
	strb w9, [x10, 0]
	mov x9, 10          // '\n'
	strb w9, [x10, 1]
	strb wzr, [x10, 2]  // '\0'
	ret
