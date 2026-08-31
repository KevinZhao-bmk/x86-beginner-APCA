;This is for homework 6-11-1
;so the syscall read usage is 
;eax<-3 ebx<-0
;ebc<-the address of the buffer
;hope i will passit

section .data
msg: db "Hey, i need you to enter two integer numbers",0ah,"please give me your choise here:"
msglen: equ $-msg
ans: db "so the sum of this to num would be:"
anslen: equ $-ans
newline: db 0ah
num1: dd 0
num2: dd 0

section .bss
buffer: resb 64

section .text
global _start, _sum
_start:

;first syscall write msg
mov eax, 4d
mov ebx, 1d
lea ecx, msg
mov edx, msglen
int 80h

;now do the syscall read
mov eax, 3d
xor ebx, ebx
mov ecx, buffer
mov edx, 64
int 80h
;no bugs till here

xor ecx, ecx
xor edx, edx
divi1:
movzx ebx, byte [buffer + ecx];testing if 0-9
cmp ebx, 48d
jb divi2
cmp ebx, 57d
ja divi2
sub ebx, 48d 

;if 0-9 -> num1
mov eax, dword [num1]
imul eax, eax, 10d
add eax, ebx
mov dword [num1], eax
inc ecx
jmp divi1

divi2:
inc ecx
movzx ebx, byte [buffer + ecx]
cmp ebx, 48d
jb divdone
cmp ebx, 57d
ja divdone
sub ebx, 48d

mov eax, dword [num2]
imul eax, eax, 10d
add eax, ebx
mov dword[num2], eax
jmp divi2
;so i successfully divided num1 and num2
;let's just do the sum !
divdone:

push num2
push num1
call _sum
add esp, 8d
adddone:
;next to put the ans

push eax
mov eax, 4d
mov ebx, 1d
mov ecx, ans
mov edx, anslen
int 80h

pop eax
mov ebx, 10d
xor ecx, ecx
divi3:
xor edx, edx
div ebx
add edx, 48d
mov byte [buffer + ecx], dl 
inc ecx
cmp eax, 0d
je divi3done
jmp divi3

divi3done:
mov eax, 4d
mov ebx, 1d
mov edx, ecx
mov ecx, buffer
int 80h
mov ecx, newline
mov edx, 1d
int 80h

done:
mov eax, 1d
xor ebx, ebx
int 80h


_sum:
push ebp
mov ebp, esp
mov eax, [ebp + 12]
mov eax, [eax]
mov ebx, [ebp + 8]
mov ebx, [ebx]
add eax, ebx
pop ebp
ret
