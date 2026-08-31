;This is for testing eflags
section .text
global _start
_start:

mov eax, 1d
mov ebx, 0xffff
add eax, ebx
pushf
pop edx
mov ecx, 3d
shift:
shr edx, 1
mov eax, edx
and eax, 1
loop shift

done:
mov eax, 1d
xor ebx, ebx
int 80h
