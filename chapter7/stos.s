#example of stos
.section .bss
.lcomm buffer, 64
.section .text
.globl _start
_start:

movq $78, %rax
leaq buffer(%rip), %rdi
movq $64, %rcx
cld
rep stosb

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
