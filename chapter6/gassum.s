#This is a copy for 6-3
.data
num1: .quad 2
num2: .quad 4

.text
.globl _start, _sum
_start:

leaq num1(%rip), %rdi
movq (%rdi), %rdi
leaq num2(%rip), %rsi
movq (%rsi), %rsi
callq _sum

done:
movq $60, %rax
xorq %rdi, %rdi
syscall

_sum:
pushq %rbp
movq %rsp, %rbp
pushq %rbx
movq %rdi, %rax
movq %rsi, %rbx
addq %rbx, %rax
popq %rbx
popq %rbp
retq
