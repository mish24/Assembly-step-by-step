.386
.model flat, c
.code

;Code by Miguel Casillas.
;This code can be used and reproduced, please give credit

;void InsertionSort(void *pArray, int nItems);
InsertionSort PROC

    ;These registers must be restored at the end
    push EBP
    mov  EBP, ESP
    push EBX
    push ESI
    push EDI
   
    ;EBP + 8    is the array
    ;EBP + 12   is the number of items in the array

    ;setting ECX to the number of items
    ;we multiply by 4 (size of the element) in order to put ECX
    ;at the last address of the array
    mov EAX, [EBP+12]  
    mov ECX, 4
    mul ECX
    mov ECX, EAX         
   
    ;We will move 'i' and 'j' in increments and decrements of 4,
    ;which is the size of the elements
    mov EAX, 4          ;EAX will be our 'i'
    xor EBX, EBX        ;EBX will be our 'j' (setting it to 0)
    mov ESI, [EBP+8]    ;ESI is the array

    MainLoop:
        ;If 'i' >= the number of items, exit the loop
        cmp EAX, ECX
        jge EndLoop
       
        ;Save our "number of items" value, we'll restore it later
        push ECX
       
        ;ECX is now our "key", so, ECX = array[i]
        mov ECX, [ESI+EAX]
       
        ;j = i-1
        mov EBX, EAX
        sub EBX, 4
       
        EnterWhile:
            ;If j < 0, exit this loop
            cmp EBX, 0
            jl EndWhile
           
            ;If array[j] <= key, exit this loop
            cmp [ESI+EBX], ECX
            jle EndWhile
           
            ;array[j+1] = array[j]
            push [ESI+EBX]
           
            pop [ESI+EBX+4]
           
            ;j--
            sub EBX, 4
           
            ;Go back to the top of this loop
            jmp EnterWhile
           
        EndWhile:
       
        ;array[j+1] = key
        mov [ESI+EBX+4], ECX
       
        ;i++
        add EAX, 4
       
        ;restore our "number of items" value
        pop ECX
       
        ;Go back to the top of the main loop
        jmp MainLoop
       
    EndLoop:
   
    ;Restoring the registers
    pop EDI
    pop ESI
    pop EBX
    pop EBP

    RET
InsertionSort ENDP

END
