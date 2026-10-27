#This time try AT&T grammar
#A test for movs 
.data
testmsg: .asciz "This is a test message for movs"
.equ testlen, (. - testmsg)
buffersize: .byte 64

.bss
.lcomm buffer 64

.text
.global _start
_start:

read:
xor %rax, %rax
xor %rdi, %rdi
leaq buffer(%rip), %rsi
leaq buffersize(%rip), %rdx
movzbq (%rdx), %rdx
#movq [rel buffersize], %rdx
syscall
pushq %rax

domovs:
popq %rcx
leaq testmsg(%rip), %rdi
leaq buffer(%rip), %rsi
#movq (%rdi, %rax, 1), %rdi#$1 because buffer .byte#?????????
#text at 22:16 01.10.2026
#What are you doing ?
#mov a value to rdi and set it as dst for movs
#and then ask why BUGS here?????
#let me tell you how to fix it , damn bro


cld
rep movsb
#BUGS THERE
#needs repair :(

write:
movq $1, %rax
movq $1, %rdi
leaq buffer(%rip), %rsi
#movq [rel buffersize], %rdx#seemingly not allowed in GAS#You'r right bro
leaq buffersize(%rip), %rdx
#movzbq buffersize(%rip), %rdx
movq (%rdx), %rdx
popq %rbx
addq %rbx, %rdx
syscall

done:
movq $60, %rax
xor %rdi, %rdi
syscall
