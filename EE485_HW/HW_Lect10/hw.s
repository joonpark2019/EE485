.section ".rodata"
cGreeting:
    .asciz "hello, world! My name is Joon Park!\n"

###-----------------------------------------

.section ".data"
###-----------------------------------------
.section ".bss"
###-----------------------------------------
.section ".text"
    .globl main
    .type main,@function

main:
    pushl %ebp
    movl %esp, %ebp

    pushl $cGreeting
    call printf
    addl $4, %esp
    movl $0, %eax
    
    movl %ebp, %esp
    popl %ebp
    ret
    
