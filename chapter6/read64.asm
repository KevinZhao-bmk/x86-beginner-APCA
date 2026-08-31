;This is read test for x86-64
;so the syscall read is basically
;rax<-0, rdi<-0(for the stdin)
;rsi<-buffer rdx<-maxlen
;and the syscall write is 
;rax<-1 rdi<-1(for stdout)
;rsi<-buffer rdx<-length
section .data
section .bss
buffer: resb 64
section .text
global _start
_start:
xor rax, rax
xor rdi, rdi
mov rsi, buffer
mov rdx, 64d
syscall

push rax
mov rax, 1
mov rdi, 1
mov rsi, buffer
push rdx
syscall 

mov rax, 60d
xor rdi, rdi
syscall
