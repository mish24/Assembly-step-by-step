# Assembly-step-by-step

## This is not a tutorial, just the codes which I am writing as I learn Assembly. 

Note please, .asm files need different sorts of commands to get `compiled`, `linked` and `run`. 
I am using NASM with Intel based coding standards.

The design is i386 with x86-64.

If you're using the same system, follow the following steps to run the program

To compile the file,
    `$ nasm -f elf64 filename.asm`
    
To link the file,
    `$ ld -s -o filename filename.o`
    
To run the file, 
    `$ ./filename`
    
    
You're done!
If you're using a differnt version, just Google it. Remember, Google is our friend.
