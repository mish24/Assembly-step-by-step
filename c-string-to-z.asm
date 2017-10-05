; x86-32
; set the value of all chars in a c string to z

%include "io.inc"

section .data
    string: db "hello", 10, 0

section .text
    global CMAIN

STRLEN:
    push ecx
    push edi
    mov eax, 0
    mov ecx, 0xFFFFFFFF
    repne scasb
    lea eax, [ecx + 1]
    neg eax
    pop edi
    pop ecx
    ret

MEMSET:
    push edi
    rep stosb
    pop edi
    ret

SET_Z:
    call STRLEN
    lea ecx, [eax - 2];
    mov eax, 0x7A
    call MEMSET
    ret

CMAIN:
    PRINT_STRING string
    mov edi, string
    call SET_Z
    PRINT_STRING string
    xor eax, eax
    ret
