.global main

main:
	MOV R4, #0
	MOV R5, #1
	MOV R6, #2		
	BL fun
	LDR R0, =a
	LDR R0, [R0]
	LDR R1, =b
	LDR R1, [R1]
	LDR R2, =c
	LDR R2, [R2]
	LDR R3, =d
	LDR R3, [R3]
	MOV R7, #1
	SVC 0
	
fun:
	PUSH {R4, R5, R6}
	SUB SP, SP, #16
	LDR R0, =a
	LDR R0, [R0]
	STR R0, [SP]
	LDR R1, =b
	LDR R1, [R1]
	STR R1, [SP, #4]
	LDR R2, =c
	LDR R2, [R2]
	STR R2, [SP, #8]
	LDR R3, =d
	LDR R3, [R3]
	STR R3, [SP, #12]	
	MOV R4, #0
	MOV R5, #0
l1:
	CMP R4, #12
	BEQ endl1
	ADD R5, R4, #4
l2:	
	CMP R5, #16
	BEQ endl2
	LDR R0, [SP, R4]
	LDR R1, [SP, R5]
	CMP R0, R1
	BMI no
	MOV R6, R0
	MOV R0, R1
	MOV R1, R6
	STR R0, [SP, R4]
	STR R1, [SP, R5]
no:
	ADD R5, #4
	B l2
endl2:
	ADD R4, #4
	B l1
endl1:
	LDR R0, =a
	LDR R1, [SP]
	STR R1, [R0]
	LDR R0, =b
	LDR R1, [SP, #4]
	STR R1, [R0]
	LDR R0, =c
	LDR R1, [SP, #8]
	STR R1, [R0]
	LDR R0, =d
	LDR R1, [SP, #12]
	STR R1, [R0]
	ADD SP, SP, #16
	POP {R4, R5, R6}
	MOV PC, LR

.data
a: .word 2
b: .word 4
c: .word 1
d: .word 3
