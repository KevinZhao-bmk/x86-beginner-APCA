#GAS struct?
.struct 0
name:
.struct name + 10
age:
.struct age + 4#???
size:

.section .data

person1:
 .ascii "Alex\0"
 .long 17

.section .bss
.lcomm buffer, 64
.section .text
.globl _start
_start:

movl %eax, person1 + age(%rip)
movq buffer(%rip), %rdi
movq person1 + name(%rip), %rsi
movq $4, %rcx
cld
rep movsb
#bugs there but i don't want to fix now
#too tired :(

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
