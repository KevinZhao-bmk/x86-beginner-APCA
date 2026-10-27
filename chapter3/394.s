#answer=(a+b)+(c+d)
.data
a: .quad 114
b: .quad 514
c: .quad 191
d: .quad 981
msg: .ascii "The answer is:\0"
.equ msglen, (.-msg)

.bss

.text
.globl _start
_start:

movq a(%rip), %rax
movq b(%rip), %rbx
addq %rax, %rbx
pushq %rbx

movq c(%rip), %rax
movq d(%rip), %rbx
addq %rax, %rbx
popq %rax
addq %rax, %rbx
pushq %rbx

movq $1, %rax
movq $1, %rdi
#movq $msg, %rsi
leaq msg(%rip), %rsi#seemingly equal to movq $msg, %rsi
movq $msglen, %rdx
syscall

popq %rbx
#some string functions needed here
#but im to lazy x)

movq $60, %rax
xorq %rdi, %rdi
syscall
