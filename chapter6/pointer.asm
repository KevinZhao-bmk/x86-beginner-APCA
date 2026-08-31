;This is a test for pointers in functions
section .data
num1: dd 0
num2: dd 0

section .bss
sum: resd 1

section .text
global _start, _sum
_start:

mov dword  [num1], 10h
mov dword  [num2], 1ah

push sum
push num1
push num2
call _sum
add esp, 8h

done:
mov eax, 1h
xor ebx, ebx
int 80h

_sum:
push ebp
mov ebp, esp
mov eax, [ebp + 12]
mov ebx, [ebp + 8]
mov eax, [eax]
mov ebx, [ebx]
add eax, ebx
mov ebx, [ebp + 16]
mov dword  [ebx], eax
pop ebp
ret
