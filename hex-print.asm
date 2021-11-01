global _start

section .data
	hexoutdata	times 8 db 0, 10, 0
	hexoutdatalength	equ $-hexoutdata

section .text

_start:
	mov eax, "abcd"
	call HexConvert

	mov eax, 4		;write to file
	mov ebx, 1		;STDOUT handle
	mov ecx, hexoutdata		; our message
	mov edx, hexoutdatalength		; size of the message
	int 80h			;execute the system call
	
	mov eax, 0efbeedfeh
	call HexConvert

	mov eax, 4		;write to file
	mov ebx, 1		;STDOUT handle
	mov ecx, hexoutdata		; our message
	mov edx, hexoutdatalength		; size of the message
	int 80h			;execute the system call

	xor ebx, ebx 		; send 0 as 'exit code'
	mov eax, 1		;terminate process
	int 80h		;execute the system call


HexConvert:
	bswap eax
	mov ecx, 8

	hexloop:
		mov ebx, eax
		and ebx, 1111b

		cmp ebx, 10
		jb hexlessthanten
		add ebx, 'a' - 10
		jmp hexdone

	hexlessthanten:
		add ebx, '0'
	hexdone:
		mov edx, hexoutdata	;Base pointer
		add edx, ecx	;Pointer offset
		dec edx			;Correct to zero-based offset
		mov esi, edx
		mov [esi], bl
		shr eax, 4
		loop hexloop

		mov eax, hexoutdata
		add eax, 8
		mov esi, eax
		mov al, 0
		mov [esi], al
	ret
