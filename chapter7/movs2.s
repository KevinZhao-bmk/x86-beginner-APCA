#another movs ,this time use std
#let's see what will happen
.data
msg: .asciz "This 42 won't drink it self and i don't need nobody else"
.equ msglen, .-msg

.bss
.lcomm lay, 64
.lcomm buffer, 64#in case needed

.text
.globl _start
_start:

#just do it!
movq $msglen, %rcx
leaq msg(%rip), %rsi
leaq buffer(%rip), %rdi
addq %rcx, %rsi
addq %rcx, %rdi
decq %rsi
decq %rdi
std #cld
rep movsb

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
