; program to write a specific name and then change 
; it using MOV

section .text
	global _start	; must be declared for the linker (ld)
_start:				; tell linker the entry point

; writing the nam 'Zara Ali'

mov edx, 9		; message length
mov ecx, name   ; message to write
mov ebx, 1      ; file descriptor (stdout)
mov eax, 4      ; system call number (sys_write)
int 0x80        ; call kernel

mov [name], dword 'Nuha'  ; Changed the name to 'Sonam'

; writing the name 'Nuha Ali'

mov edx, 8   ; message length
mov ecx, name ; message to write
mov ebx, 1    ; file descriptor (stdout)
mov eax, 4    ; system call number (sys_write)

int 0x80      ; calll kernel
mov eax, 1    ; system call number (sys_exit)

int 0x80      ; call kernel

section .data
name db 'Zara Ali  '

