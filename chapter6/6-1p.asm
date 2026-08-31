;This is a recure for 6-1
section .data
num1: dd 3
num2: dd 5

section .text
global _start, _sum

_start:

push dword [num2]
push dword [num1]
call _sum
add esp, 0d8

done:
mov eax, 1
xor ebx, ebx
int 80h

_sum:
push ebp
mov ebp, esp
mov eax, [ebp + 12]
mov ebx, [ebp + 8]
add eax, ebx
pop ebp
ret

