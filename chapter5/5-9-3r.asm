;This is a reform version of 5-9-3
;so i called it 5-9-3r.asm
section .data
num: dd 0xffff
numlen: equ $ - num
;loopt: db 0

section .bss
buf: resb 16

section .text
global _start
_start:

mov ebx, 0d10
xor ecx, ecx
mov eax, dword [num]

pick:
xor edx, edx
div ebx
add edx, 0d48
mov byte [buf + ecx], dl
inc ecx
cmp eax, 0b0
jne pick

check:
mov eax, 0d4
mov ebx, ecx
mov ecx, buf
mov edx, ebx
mov ebx, 0d1
;the length of the buf is already in ecx
int 80h
;Yes it did it 
;but a little bug
;i have to reverse the number
;it would be 65535 instead of 53556

done:
mov eax, 0d1
xor ebx, ebx
int 80h

