.data
num: .quad 12321508171923
.equ num2, 12331608
.text
.globl _start
_start:

leaq num(%rip), %rax
movq (%rax), %rax

xorq %rax, %rax
movq num, %rax

movq $num2, %rax
leaq num2, %rax#these two seemingly the same

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
