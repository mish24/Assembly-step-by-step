; practicing my own assembly codes

section .text
	global _start		;must be declared for the linker (ld)

_start:		;tells the linker the entry point of the code
	mov edx, len ; message length
	mov ecx, number ; number to display
	mov ebx, 1		; file descriptor (stdout)
	mov eax, 4		; system call number for write 
	int 0x80		; calling the kernel 

	mov eax, 1		; system call for existing
	int 0x80		; kernel call
	; all this has to be done no matter what.

section .data

number db '3', 0xa, '5', 0xa, '4', 0xa
len equ $ - number		; length of the string