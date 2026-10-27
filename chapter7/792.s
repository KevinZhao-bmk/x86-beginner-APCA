#homework 7.9.2
.section .data
msg1: .ascii "I DON'T KNOW WHAT WE'RE YELLING ABOUT! bbab\0"
.equ msg1len, .-msg1

.section .bss
.lcomm buffer, 64

.section .text
.globl _start
_start:

#upper to lower
movq $msg1len, %rcx
#decq %rcx
leaq buffer(%rip), %rdi
leaq msg1(%rip), %rsi
looP:
lodsb 
cmpb $65, %al
jb notupper
cmpb $90, %al
ja notupper
addb $32, %al
notupper:
stosb
loop looP #OMG IT WORKS!!!!


done:
movq $60, %rax
xorq %rdi, %rdi
syscall
