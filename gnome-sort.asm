.386
.model flat, c
.code

;Code by Miguel Casillas.
;This code can be used and reproduced, please give credit

;void GnomeSort(void *pArray, int nItems);
GnomeSort PROC

    ;These registers must be restored at the end
    push EBP
    mov  EBP, ESP
    push EBX
    push ESI
    push EDI
   
    ;EBP + 8    is the array
    ;EBP + 12   is the number of items in the array

    mov ESI, [EBP+8]    ;ESI is the array
    mov ECX, [EBP+12]   ;setting ECX to the number of items
    xor EAX, EAX        ;Setting EAX to 0, it'll be our iterator
   
    MainLoop:
        ;If 'i' >= the number of items, exit the loop
        cmp EAX, ECX
        jge EndLoop    
       
        ;If 'i' == 0, move to the next element
        cmp EAX, 0
        je IncreaseCounter
       
        ;If array[i-1] <= array[i], it means they are
        ;sorted, so move to the next element
        mov EBX, [ESI]      ;EBX = array[i]
        mov EDX, [ESI-4]    ;EDX = array[i-1]
        cmp EDX, EBX
        jle IncreaseCounter
       
        ;else, swap array[i-1] with array[i]
        push [ESI]
        push [ESI-4]
       
        pop [ESI]
        pop [ESI-4]
       
        ;Move to the previous element in the array
        ;and decrease 'i'
        sub ESI, 4
        dec EAX
       
        ;Loop back to the top
        BackToMainLoop:
        jmp MainLoop
       
        ;Moving to the next element in the array
        ;and increasing 'i'
    IncreaseCounter:
        inc EAX
        add ESI, 4
        jmp BackToMainLoop
   
    EndLoop:
   
    ;Restoring the registers
    pop EDI
    pop ESI
    pop EBX
    pop EBP

    RET
GnomeSort ENDP

END
