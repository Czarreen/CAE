; -- header --
bits 64
default rel
; -- variables --
section .bss
read_number resq 1 ; 64-bits integer = 8 bytes
; -- constants --
section .data
read_format db "%d", 0 ; the format string for scanf
string_literal_0 db "", 0
; -- Entry Point --
section .text
global main
extern ExitProcess
extern printf
extern scanf
          
main:
	PUSH rbp
	MOV rbp, rsp
	SUB rsp, 32
; -- READ  --
	LEA rcx, read_format
	LEA rdx, read_number
	XOR eax, eax
	CALL scanf
	PUSH qword [read_number]
; -- ADD  --
	POP rax
	ADD qword [rsp], rax
; -- PRINT  --
	LEA rcx, string_literal_0
	XOR eax, eax
	CALL printf
; -- HALT  --
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
