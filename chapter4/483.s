#create an array and mult 8
.data
array: .quad 3,14,2,9,17,1738,2026,10,1,0
.equ arraylen, (.-array)

.bss
.lcomm result, 128

.text
.globl _start
_start:

leaq array(%rip), %rbx
leaq result(%rip), %r8
movq $arraylen, %rcx
movq $8, %r9 
movq %rcx, %rax
divq %r9
movq %rax, %rcx
xorq %r10, %r10
Mul:
incq %r10
decq %rcx
movq (%rbx, %rcx, 8), %rax
incq %rcx
mulq %r9
movq %rax, (%r8, %rcx, 8)
#loop quite hard to use
loop Mul

done:
movq $60, %rax
xorq %rdi, %rdi
syscall
