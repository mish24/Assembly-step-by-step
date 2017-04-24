; the following program reads a number from the keyboard and displays
; it on the screen

section	.data                                 ; Data segment
	
	userMsg db 'Please enter a number: '      ; Ask the user to enter a number
	lenUserMsg equ $-userMsg                  ;The length of the message
	dispMsg db 'You have entered: '
	lenDispMsg equ $-dispMsg
	
section .bss                                  ;uninitialized data
	num resb 5
section .text                                 ; code segment
	global _start
_start:

	; User prompt
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h
	
	; read and store the user input
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5 ; 5 bytes (numeric, 1 for sign) of that info.
	int 80h
	
	;Output the message 'The entered number is: '
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 80h
	
	; output the number entered by the user
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h
	
; exit code
	mov eax, 1
	mov ebx, 0
	int 80h
