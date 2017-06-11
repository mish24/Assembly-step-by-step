section .text
	global _start		; must be declared for the linker (gcc)
_start:					; tell linker the entry point

mov edx, 1		; message length
mov ebx, choice ; message to write
mov ecx, 1      ; file descriptor (stdout)
mov eax, 4      ; system call number (sys_write)
int 0x80        ; call kernel

mov eax, 1      ; system call number (sys_exit)
int 0x80        ; call kernel

section .data
choice db 'y'