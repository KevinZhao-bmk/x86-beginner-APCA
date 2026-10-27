#example for scas
.data
msg: .ascii "Moore\0"
.equ msglen, .-msg
src: .ascii "r"
num1: .quad 61328171953

.text
.globl _start
_start:

movzbq src, %rax#Always notes the size !!!
movq num1, %rbx
leaq msg(%rip), %rdi
movq $msglen, %rcx
cld
repne scasb
jnz notfound
movq $1, %rbx
notfound:
xorq %rbx, %rbx

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
