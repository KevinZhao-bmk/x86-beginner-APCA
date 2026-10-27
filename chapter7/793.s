#homework for 7.9.3
#disassembly strstr()???
.section .data
msg1: .ascii "This is a test for such a quite hard exam :(\0"
.equ msg1len, .-msg1
msg2: .ascii "is\0"
.equ msg2len, .-msg2

.section .bss
.lcomm buffer, 64

.section .text
.globl _start, _sub_find
_start:

#first test the fuction _sub_find
#temporarily no bugs
xorq %rax, %rax
xorq %rbx, %rbx

leaq msg2(%rip), %rsi
movb (%rsi), %al
leaq msg1(%rip), %rdi
movq $msg1len, %rcx
cld
looP:
repne scasb
cmpq $0, %rcx
jbe outloop
#incq %rbx
#time to call _sub_find
pushq %rax
pushq %rcx
pushq %rdi
leaq msg2(%rip), %rsi
#does rdi changes??#yes, it movs when repne
subq $1, %rdi
callq _sub_find
popq %rdi
popq %rcx
cmpq $1, %rax
jne notthis
movq %rcx, %r8 
popq %rax
jmp outloop
notthis:
popq %rax
loop looP
outloop:

#got %rcx in %r8 for the position
movq $msg1len, %rcx
subq %r8, %rcx
decq %rcx
#theoretially rcx would be the answear

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
#last edited 2026.10.06 17:21

_sub_find:#rdi<-rdi,the str rsi<-rsi,the substr to find
#or to store the lenght in rdx??
pushq %rbp
pushq %r12
movq %rsp, %rbp

#calculate the lenght of rsi first?
xorq %rcx, %rcx
xorq %rax, %rax#means no, rsi is not the substr of rdi
meas:
movb (%rsi, %rcx, 1), %r12b
cmpb $0, %r12b
je endfind
incq %rcx
jmp meas
endfind:


cmpq $0, %rcx
je sub_find_zero

cld
repe cmpsb
jne notequal
sub_find_zero:
movq $1, %rax#means yes ,rsi is the substr of rdi

notequal:

popq %r12
popq %rbp
retq
