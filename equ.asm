SYS_EXIT equ 1
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

section .text

global _start ;must be declared for using gcc
_start: ; tell linker the entry point

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg2
mov edx, len2
int 0x80

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg1
mov edx, len1
int 0x80

mov eax, SYS_WRITE
mov ebx, STDOUT
mov ecx, msg3
mov edx, len3
int 0x80

mov eax, SYS_EXIT ; system call number
int 0x80

section .data ; here we define the data
msg1 db 'Hello, programmer!', 0xA, 0xD
; 0xA --> next line
; 0xD --> start of the line
len1 equ $ - msg1

msg2 db 'My name is Mishra', 0xA, 0xD
len2 equ $ - msg2

msg3 db 'I love Linux Assembly Programming :)', 0xA, 0xD
len3 equ $ - msg3
