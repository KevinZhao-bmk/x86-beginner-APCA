;this is a test for function in a function
section .data
msg1: db "Hey this is funciton one",0ah
msg1len:equ $-msg1
msg2: db "Hey this is funciton two ,i'm in the function one now.",0ah
msg2len:equ $-msg2
section .text
global _start, func1, func2
_start:

call func1

done:
mov rax, 3ch
xor rdi, rdi
syscall

func1:
push rbp
mov rbp, rsp
mov rax, 1
mov rdi, 1
lea rsi, [rel msg1]
mov rdx, msg1len
syscall;we have call func1 and push rbp before,
;so rsp can be divided by 10h,so probably ok for this?

call func2

pop rbp
ret

func2:
push rbp
mov rbp, rsp
mov rax, 1
mov rdi, 1
lea rsi, [rel msg2]
mov rdx, msg2len
syscall

pop rbp
ret
