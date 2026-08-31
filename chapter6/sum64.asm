;This is function test in x86-64
section .data
num1: dq 0
num2: dq 0

section .bss
buffer: resb 64

section .text
global _start, picknum
_start:

xor rax, rax
xor rdi, rdi
mov rsi, buffer
mov rdx, 64d
syscall;to read lines

mov rdi, buffer
mov rsi, rax
mov rdx, num1
call picknum

done:
mov rax, 60d
xor rdi, rdi
syscall

picknum:
push rbp
;push rbx;so this seemed necessary?
;turns out no
mov rbp, rsp
mov rcx, rsi
pick:
mov al, byte [rdi + rcx - 1];so this is the otm for loop
cmp al, 0ah
je ent
;cmp al, 0
;je otm
cmp al, 48d
jb notnum
cmp al, 57d
ja notnum
sub al, 48d
mov rbx, qword [rdx]
imul rbx, rbx, 10d
movzx rax, al
add rbx, rax
mov qword [rdx], rbx
;otm:
;cmp rcx, 1
;jb notnum
ent:
loop pick;FUCK! I SHOULD NOT USE LOOP !!!!
;turns out this loop would make rcx mov between 1 - len
notnum:
;pop rbx
pop rbp
ret
