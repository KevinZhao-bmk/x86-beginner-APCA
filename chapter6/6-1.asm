;This is an example for sum in nasm
section .data
num1: dd 2
num2: dd 4

section .text
global _start, _sum
_start:

mov eax, 0d10
dec eax
mov ebx, 0d5;This is for some calculation before call _sum
;to show some functions i guess?


push dword [num2]
push dword [num1]
call _sum
add esp, 0d8

add eax, ebx
dec eax;This is  also some meaningless instructions (?)

done:
mov eax, 0d1
xor ebx, ebx
int 80h

_sum:
push ebp
mov ebp, esp
push ebx
mov ebx, [ebp + 8]
mov eax, [ebp + 12]
add eax, ebx
pop ebx
pop ebp
ret
