; trying to understand db stuff

section .text
	global _start		;must be declared to tell the linker

_start:		; tells the linker the entry point of the code
	mov edx, len	; message length
	
	mov ecx, l1		; first symbol
	
	mov ebx, 1		; file descriptor
	mov eax, 4		; system call for write
	int 0x80		; calling the kernel


	mov eax, 1		; system call for exiting
	int 0x80		; for some reason it's always here

section .data

l1 db '0' ,'1' ,'2' ,'3', '4', 0xa
len equ $ - l1


