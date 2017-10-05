.386
.model flat, c
.code

;Code by Miguel Casillas.
;This code can be used and reproduced, please give credit

;void QuickSort(void *pArray, int nItems);
QuickSort PROC

    ;These registers must be restored at the end
    push EBP
    mov EBP, ESP
    push EBX
    push ESI
    push EDI
   
    ;EBP + 8    is the array
    ;EBP + 12   is the number of items in the array
   
    mov ESI, [EBP+8]    ;ESI is the array
   
    ;setting ECX to the number of items
    ;we multiply by 4 (size of the element) in order to put ECX
    ;at the last address of the array
    mov EAX, [EBP+12]
    mov ECX, 4
    mul ECX
    mov ECX, EAX
   
    ;EAX will be our 'low index', we initially set it to 0
    xor EAX, EAX
   
    ;EBX will be our 'high index', we initially set it to
    ;the last element of the array (currently stored in ECX)
    mov EBX, ECX
   
    ;We now call our recursive function that will sort the array
    call QuickRecursive
       
    ;Restoring the registers
    pop EDI
    pop ESI
    pop EBX
    pop EBP

    RET
QuickSort ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Recursive QuickSort function
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
QuickRecursive:
   
    ;if lowIndex >= highIndex, we exit the function
    cmp EAX, EBX
    jge PostIf
   
    push EAX    ;saving our low index, now EAX is 'i'
    push EBX    ;saving our high index, now EBX is 'j'
    add EBX, 4  ;j = high + 1
   
    ;EDI is our pivot
    ;pivot = array[lowIndex];
    mov EDI, [ESI+EAX]
   
    MainLoop:

        iIncreaseLoop:
           
            ;i++
            add EAX, 4
           
            ;If i >= j, exit this loop
            cmp EAX, EBX
            jge End_iIncreaseLoop
           
            ;If array[i] >= pivot, exit this loop
            cmp [ESI+EAX], EDI
            jge End_iIncreaseLoop
           
            ;Go back to the top of this loop
            jmp iIncreaseLoop

        End_iIncreaseLoop:
       
        jDecreaseLoop:
       
            ;j--
            sub EBX, 4
           
            ;If array[j] <= pivot, exit this loop
            cmp [ESI+EBX], EDI
            jle End_jDecreaseLoop
           
            ;Go back to the top of this loop
            jmp jDecreaseLoop

        End_jDecreaseLoop:
       
        ;If i >= j, then don't swap and end the main loop
        cmp EAX, EBX
        jge EndMainLoop
       
        ;Else, swap array[i] with array [j]
        push [ESI+EAX]
        push [ESI+EBX]
       
        pop [ESI+EAX]
        pop [ESI+EBX]
       
        ;Go back to the top of the main loop
        jmp MainLoop
       
    EndMainLoop:       
   
    ;Restore the high index into EDI
    pop EDI
   
    ;Restore the low index into ECX
    pop ECX
   
    ;If low index == j, don't swap
    cmp ECX, EBX
    je EndSwap
   
    ;Else, swap array[low index] with array[j]
    push [ESI+ECX]
    push [ESI+EBX]
       
    pop [ESI+ECX]
    pop [ESI+EBX]
       
    EndSwap:

    ;Setting EAX back to the low index
    mov EAX, ECX
   
    push EDI    ;Saving the high Index
    push EBX    ;Saving j
   
    sub EBX, 4  ;Setting EBX to j-1
   
    ;QuickSort(array, low index, j-1)
    call QuickRecursive
   
    ;Restore 'j' into EAX
    pop EAX
    add EAX, 4  ;setting EAX to j+1
   
    ;Restore the high index into EBX
    pop EBX
   
    ;QuickSort(array, j+1, high index)
    call QuickRecursive
   
    PostIf:

RET

END
