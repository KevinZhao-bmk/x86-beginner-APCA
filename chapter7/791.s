#homework for 7.9.1
.section .data
msg1: .ascii "Try harder\0"
.equ msg1len, .-msg1
msg2: .ascii "Try harder still\0"
.equ msg2len, .-msg2

.section .bss
.section .text
.globl _start
_start:

movq $msg1len, %rax
cmpq $msg2len, %rax
ja b1#b1 means rax = msg1len > msg2len
movq $msg1len, %rcx
jmp cmpd
b1:
movq $msg2len, %rcx
cmpd:#rcx now the min of msg1len and msg2len

pushq %rcx#remember the initial rcx
leaq msg1(%rip), %rdi
leaq msg2(%rip), %rsi#rdi, rsi seemingly changing during the repe
cld
repe cmpsb
jnz notequal
xorq %rax, %rax#rax=0 ,the two strings completely the same

notequal:
leaq msg1(%rip), %rdi
leaq msg2(%rip), %rsi
popq %rcx
movq $1, %rax#completely different
loop:
movb (%rdi, %rcx, 1), %bl
movb (%rsi, %rcx, 1), %dl
cmpb %bl, %dl
jne dif
movq $2, %rax#partly same
dif:
decq %rcx
cmpq $1, %rcx
ja loop

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
