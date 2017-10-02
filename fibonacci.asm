.text                         # this is how you start the "program" section 
.globl main                   # "main" (below) should be callable outside this file 
main: 
  lw $t0, firstnum            # $t0 = First Number (usually 1 for Fibonacci) 
  lw $t1, secondnum           # $t1 = Second Number(also usually 1 for Fibonacci) 
  li $t2, 2                   # $t2 = Current Step Number, starts at 2 
  la $t3, mem                 # $t3 = address to write the remaining Fibonacci #'s to 
loop: 
  add $t0, $t0, $t1           # Add $t1 to $t0, then $t0 to $t1 to get the next 2 
  add $t1, $t1, $t0           # Fibonacci numbers in the sequence. 
  sw $t0, 0($t3)              # store these next 2 #'s in the next place in the array 
  sw $t1, 4($t3) 
  addiu $t3, $t3, 8           # move 8 bytes forward to find the next blank space in 
                              # the array 
  addiu $t2, $t2, 2           # increment "steps" to show we've gone 2 more steps 
  j loop                      # loop endlessly generating more numbers, eventually 
                              # crashing 
  jr $ra                      # this is the standard way to return from a procedure,  
                              #but this is never reached 
.data                         # this is how you start the "data" section 
firstnum:   .word 1           # First number for Fibonacci sequence 
secondnum:  .word 1           # Second number for Fibonacci sequence 
mem:        .space 4096   
