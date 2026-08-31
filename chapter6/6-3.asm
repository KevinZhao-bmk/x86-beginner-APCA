;This is an example in book
section .data
num1: dq 2
num2: dq 4

section .text
global _start, _sum
_start:

mov rax, 10d
dec rax
mov rbx, 5

lea rdi, [rel num1]
lea rsi, [rel num2]
call _sum

add rax, rbx
dec rax

mov rax, 60d
xor rdi, rdi
syscall

_sum:
push rbp
mov rbp, rsp
push rbx
mov rax, [rdi]
add rax, [rsi]
pop rbx
pop rbp
ret
