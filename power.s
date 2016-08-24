.section .data

.section .text

.globl _start

_start:
    pushl $3
    pushl $2
    call power

    addl $8, %esp
    pushl %eax

    pushl $2
    pushl $5
    call power

    addl $8, %esp
    popl %ebx

    addl %eax, %ebx
    movl $1, %eax
    int $0x80

.type power, @function
power:
    movl 4(%esp), %eax
    movl 8(%esp), %ecx

power_loop_start:
    cmpl $1, %ecx
    je end_power
    imull 4(%esp), %eax
    decl %ecx
    jmp power_loop_start

end_power:
    ret

