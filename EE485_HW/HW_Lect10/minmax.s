.section ".rodata"
Prompt:
    .asciz "Type a number\n"
Prompt2:
    .asciz "The sum from %d to %d = %d\n"
scanfFormat:
    .asciz "%d"

### --------------------------------------------------------------------
.section ".bss"

### --------------------------------------------------------------------
.equ    X,  -12
.equ    Y,  -8
.equ    SUM, -4
.equ    MIN, 12
.equ    MAX, 8
.equ    INDEX, -8

.section ".text"
    .globl main
.type main, @function

main:
    pushl %ebp
    movl %esp, %ebp

    subl $4, %esp
    subl $4, %esp
    subl $4, %esp
### printf for x:
    pushl $Prompt
    call printf
    addl $4, %esp

leal X(%ebp), %eax
### scanf for x:
    pushl %eax
    pushl $scanfFormat
    call scanf
    addl $8, %esp

### printf for y:
    pushl $Prompt
    call printf
    addl $4, %esp

leal Y(%ebp), %eax
###scanf for y:
    pushl %eax
    pushl $scanfFormat
    call scanf
    addl $8, %esp

    movl X(%ebp), %eax
    cmpl %eax, Y(%ebp)
    jg maximize

###else: if X is the maximum
    pushl Y(%ebp)
    pushl X(%ebp)

    movl X(%ebp), %eax
    movl Y(%ebp), %ebx
    movl %eax, -8(%ebp)
    movl %ebx, -12(%ebp)
    jmp next

###if Y is the maximum:
maximize:
    pushl X(%ebp)
    pushl Y(%ebp)

###minimum is higher in the stack than maximum:
next:
    call dosum
    addl $8, %esp
    movl %eax, SUM(%ebp)

###return the main function
###print out message

    pushl $Prompt2
    call printf
    addl $4, %esp

    movl %ebp, %esp
    popl %ebp
    ret

dosum:
    pushl %ebp
    movl %esp, %ebp

    pushl $0
    subl $4, %esp
    movl MIN(%ebp), %eax
    movl %eax, INDEX(%ebp)
    movl %eax, -4(%ebp)

loop1:
    movl INDEX(%ebp), %eax
    cmp MAX(%ebp), %eax
    jg  endloop1
    movl MIN(%ebp), %eax
    addl %eax, -4(%ebp)
    incl INDEX(%ebp)
    jmp loop1

endloop1:
    movl -4(%ebp), %eax
    movl %ebp, %esp
    popl %ebp
    ret
