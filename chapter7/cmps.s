#an example of cmps
.data
msg1: .ascii "This is a test string 1233400717102202102026\0"
.equ msg1len, .-msg1
msg2: .asciz "This is a test string 1235400717102302102026"
.equ msg2len, .-msg2
.bss
.lcomm buffer, 64
#cmps msg1 and msg2 first
#get false and then movs msg2 to msg1
#cmps again and get true
#let's forking gooooo
.text
.globl _start
_start:

#compare lenght first
movq $msg1len, %rdi
movq $msg2len, %rsi
xorq %rax, %rax
cmpq %rdi, %rsi
jne NOTEQUAL

#do the cmps
leaq msg1(%rip), %rsi
leaq msg2(%rip), %rdi
movq $msg1len, %rcx
cld#std
repe cmpsb

jnz NOTEQUAL

movq $1, %rax#rax=1 means equal temporarily

NOTEQUAL:
#do the movs
leaq msg1(%rip), %rdi#seemingly unecessary need to change this?
leaq msg2(%rip), %rsi
movq $msg2len, %rcx
cld#std
rep movsb

#do the cmps again
leaq msg1(%rip), %rdi
leaq msg2(%rip), %rsi
movq $msg2len, %rcx
cld#std
repe cmpsb
jnz done
movq $1, %rax

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
