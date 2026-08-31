;This is a 64bit assembly
section .data
msg: db "Hello world!",0ah
msglen:equ $-msg

section .text
global _start
_start:

;so This is syscall write in x86_64
mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, msglen
syscall

done:
mov rax, 60
xor rdi, rdi
syscall
