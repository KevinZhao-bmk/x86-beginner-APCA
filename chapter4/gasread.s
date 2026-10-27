#another test for read and write
.data
msg: .ascii "Hey enter a test string here\0"
.equ msglen, .-msg

.bss
.lcomm buffer, 64

.text
.globl _start
_start:

movq $1, %rax
movq $1, %rdi
leaq msg(%rip), %rsi
movq $msglen, %rdx
syscall

xorq %rax, %rax
xorq %rdi, %rdi
leaq buffer(%rip), %rsi
movq $64, %rdx
syscall

pushq %rax
movq $1, %rax
movq $1, %rdi
leaq buffer(%rip), %rsi
popq %rdx
syscall

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
