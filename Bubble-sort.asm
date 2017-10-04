;Bubble sort 10 numbers in place

.model tiny
.data
nums  db 3,7,9,1,8,2,4,5,3,6,10
count equ 9                         ; One less than count of the array.

.code
.startup
    mov dx, count
    oloop:
        mov cx, count
        lea si, nums

        iloop:
            mov al, [si]                 ; Because compare can't have both memory
            cmp al, [si+1]
            jl common                      ; if al is less than [si+1] Skip the below two lines for swapping.
            xchg al, [si+1]
            mov [si], al                    ; Coz we can't use two memory locations in xchg directly.

            common:
                INC si
                loop iloop

        dec dx
        jnz oloop

.exit
end
