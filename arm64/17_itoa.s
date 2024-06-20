/* print itoa: convert and print an 
integer to ascii representation.
Luis Espino 2024 */

.global _start

.text
_start:
	ldr x0, =str		// load addr of str
	mov x1, 12345		// number to convert
	mov x2, 10		    // base number
	mov x3, 0		    // number size = 0
	mov x4, x1		    // copy of number 

getsize:
	udiv x4, x4, x2		// remove last digit
	add x3, x3, 1		// increment size
	cmp x4, 0		    // if number != 0
	bne getsize		    // goto getsize
	
	add x0, x0, x3		// str addr offset
	mov w5, 10		    // newline ascii
	strb w5, [x0]		// store newline
	sub x0, x0, 1		// decrement offset
	add x3, x3, 1		// str final size
	mov x4, x1		    // copy of number 
	mov x5, 0		    // iter number = 0
	
getdigit:
	udiv x6, x4, x2		// remove last digit	
	msub x7, x6, x2, x4	// last digit
	add x5, x5, 1		// increment iter
	strb w7, [x0]		// store last digit
	sub x0, x0, 1		// decrement offset
	mov x4, x6		    // number remain
	cmp x4, 0		    // if number != 0
	bne getdigit		// goto getdigit
	add x0, x0, 1		// reset addr

setascii:	
	ldrb w8, [x0]		// load left digit
	add w8, w8, 48		// set ascii
	strb w8, [x0]		// store ascii
	add x0, x0, 1		// increment offset
	sub x5, x5, 1		// decrement iter
	cmp x5, 0		    // if iter != 0
	bne setascii		// goto setascii
	
print:
	mov x0, 1		    // stdout
	ldr x1, =str		// load str
	mov x2, x3		    // str size
	mov x8, 64		    // write syscall_num
	svc 0			    // syscall

exit: 
	mov x8, 93		    // exit syscall_num
	svc 0			    // syscall

.data
str: .space 20
