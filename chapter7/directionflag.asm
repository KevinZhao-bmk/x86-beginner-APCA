section .data
msg: db "This is a test for revers strings",0ah
msglen:equ $-msg
section .text
global _start
_start:

mov rax, 1d
mov rdi, 1d
lea rsi, [rel msg]
mov rdx, msglen
syscall

cld
mov rax, 1d
mov rdi, 1d
lea rsi, [rel msg]
mov rdx, msglen
syscall
;seems cld or std not working for input and output(?

done:
mov rax, 60d
xor rdi, rdi
syscall
