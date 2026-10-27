#a review in chapter3 
#this time in GAS
.data
sum: .quad 0x10000
message: .ascii "Welcome to Assembly progamming.\nYour grade will be randomly assigned\nby the Intel 8086 processor!\0"
.equ messagelen, (.-message)

.bss
.lcomm imput, 1
.text
.global _start
_start:

movq $1, %rax
movq $1, %rdi
movq $message, %rsi
movq $messagelen, %rdx
syscall

movq $200, imput

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
