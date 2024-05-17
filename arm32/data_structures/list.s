.global main

main:
	PUSH {FP, LR}		@ save frame and stack pointer
	MOV R11, SP		@ save stack to frame
	MOV R0, #3		@ add 3 to list
	BL add
	MOV R0, #2		@ add 2 to list
	BL add
	MOV R0, #1		@ add 1 to list
	BL add
	MOV R0, #0
	POP {FP, LR}		@ restore frame and stack pointer
	BX LR			@ exit
add:
	LDR R1, =head    	@ load head address
	LDR R1, [R1]		@ load address in head
	CMP R1, #0		@ head is null?
	BEQ empty
	MOV SP, R1		@ SP = address in head
	SUB SP, SP, #8	 	@ tmp node allocation
	STR R0, [SP]		@ assign val
	STR R1, [SP, #4] 	@ assign next
	LDR R1, =head		@ load head address
	STR SP, [R1]		@ head = tmp
	MOV SP, FP		@ restore SP with FP
	MOV PC, LR		@ return to main
empty:
	SUB SP, SP, #64	 	@ 64bytes distant allocation
	LDR R1, =head		@ load head	address
	STR SP, [R1]		@ save distant allocation to head
	STR R0, [SP]		@ assign val
	MOV R1, #0			
	STR R1, [SP, #4]	@ assign null to next (lastone)
	ADD SP, SP, #64		@ restore 64bytes
	MOV PC, LR		@ return to main

.data
head:				@ pointer
  	.long   0
