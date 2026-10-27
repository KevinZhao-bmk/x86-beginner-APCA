section .data
msg1: db "this is assembly, hello cpp",0ah
msg1len:equ $-msg1
msg2: db "probably, the nums is:"
msg2len:equ $-msg2
space: db ' '
spacelen:equ $-space
section .bss
num1: resq 1
section .text
global asmMain
asmMain:
push rbx
push rbp
push rsi
push rdi
mov rax, 1
mov rdi, 1
;mov rsi, msg1;this should change to below
lea rsi, [rel msg1]
mov rdx, msg1len
syscall

mov rax, 1
mov rdi, 1
;mov rsi, msg2;this is also
lea rsi, [rel msg2]
mov rdx, msg2len
syscall

mov rax, 1
pop rdi
add rdi, 48d
mov qword [rel num1], rdi
;mov rsi, num1;and this
lea rsi, [rel num1]
mov rdi, 1
syscall

;this is a space
mov rax, 1
mov rdi, 1
;mov rsi, space
lea rsi, [rel space]
mov rdx, spacelen
syscall

mov rax, 1
pop rsi
add rsi, 48d
mov qword [rel num1], rsi
;mov rsi, num1
lea rsi, [rel num1]
mov rdi, 1
syscall

pop rbp
pop rbx
ret
