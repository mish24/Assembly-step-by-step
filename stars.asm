

section .text
	global _start	;must be declared for the linker (ld or gcc)

_start:		; telling the linker the entry point of the code
	
	mov edx, len	; message length
	mov ecx, msg    ; message to write
	mov ebx, 1      ; file descriptor (stdout)
	mov eax, 4      ; system call number for writing
	int 0x80        ; calling the kernel

	mov edx, 9      ; message length
	mov ecx, s2     ; message to write
	mov ebx, 1      ; file descriptor to stdout
	mov eax, 4      ; system call for writing
	int 0x80        ; calling the kernel

	mov eax, 1      ; system call number for exiting
	int 0x80        ; call kernel

section .data
msg db 'Displaying 9 stars bro, such a feat :P', 0xa 
len equ $ - msg
s2 times 9 db '*', 0xa