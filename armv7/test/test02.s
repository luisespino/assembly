.global main

main:
    	LDR R0, =array
    	LDR R1, =size
	BL fun1
    	LDR R0, =array
	MOV R1, #0
	BL fun2
	LDR R0, =array
    	LDR R1, =size
	BL fun3
	LDR R0, =array
    	MOV R1, #0
	BL fun4
	MOV R7, #1
	SVC 0
	
fun1:
    	SUB R1, R1, #1
    	LSL R1, R1, #2
    	ADD R1, R0, R1
loop_fun1:
	LDR R2, [r0]
	LDR R3, [r1]
	STR R3, [r0]
	STR R2, [r1]
	ADD R0, R0, #4
	SUB R1, R1, #4
	CMP R0, R1
	BLT loop_fun1
	BX LR
	
fun2: 
loop_fun2:
	LDR R2, [R0, R1, LSL #2]
	LSL R2, R2, #1
	STR R2, [R0, R1, LSL #2]
	ADD R1, R1, #1
	CMP R1, #size
	BLT loop_fun2
	BX LR
	
fun3:
loop_fun3_1:
    	MOV R2, #0
    	MOV R6, #0
loop_fun3_2:
    	ADD R3, R2, #1
    	CMP R3, R1
    	BGE end_loop_fun3_2
    	LDR R4, [R0, R2, LSL #2]
    	LDR R5, [R0, R3, LSL #2]
    	CMP R4, R5
    	STRGT R5, [R0, R2, LSL #2]
    	STRGT R4, [R0, R3, LSL #2]
    	ADDGT R6, R6, #1
    	MOV R2, R3
    	B loop_fun3_2
end_loop_fun3_2:
    	CMP R6, #0
    	SUBGT R1, R1, #1
    	BGT loop_fun3_1
	BX LR

fun4:
	MOV R3, #0
	MOV R4, #0	
loop_fun4:
	LDR R2, [R0, R1, LSL #2]
	ADD R3, R3, R2
	ADD R1, R1, #1
	CMP R1, #size
	BLT loop_fun4	
	MOV R2, #0
	LDR R4, =size
loop_fun4_2:
	ADD R2, R2, #1
	SUB R3, R3, R4
	CMP R3, #0 
	BGT loop_fun4_2
	MOV R1, #0
	MOV R5, #0
loop_fun4_3:	
	LDR R3, [R0, R1, LSL #2]
	SUB R3, R3, R2
	MUL R4, R3, R3
	ADD R5, R5, R4
	ADD R1, R1, #1
	CMP R1, #size
	BLT loop_fun4_3
	MOV R2, #0
	LDR R6, =size
loop_fun4_4:
	ADD R2, R2, #1
	SUB R5, R5, R6
	CMP R5, #0 
	BGT loop_fun4_4
	MOV R0, R2
	BX LR

.data	
array: .word 1, 2, 3, 4, 5
size = 5
