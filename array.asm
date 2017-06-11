# program to print an array of a pre defined size

section .text
	global _start		; required for the linker (ld)
_start:                 ; start of the main program

mov edx, 10             ; size of the array
mov ecx, stars          ; declaring what is the name of the variable
mov ebx, 1              ; file descriptor (stdout)
mov eax, 4              ; system call number for writing
int 0x80                ; calling the kernel

mov eax, 1              ; for exiting the system
int 0x80                ; calling the kernel again

section .data
stars times 10 db '*'