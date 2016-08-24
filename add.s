.section .data
.section .text

.globl _start

_start:
    pushl $4
    call add

    addl $4, %esp
    movl %eax, %ebx

    movl $1, %eax
    int $0x80

.type add, @function
add:
    movl 4(%esp), %eax
    addl $4, %eax
    ret


