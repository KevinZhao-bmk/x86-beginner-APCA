;This is for testing stack frame
;which seemed quite abstract
section .text
global _start, _test
_start:

mov eax, 0d1
push eax
mov eax, 0d2
push eax
mov ecx, 0d3
push eax
pop eax
pop eax
pop eax


done:
mov eax, 0d1
xor ebx, ebx
int 80h

_test:
xor eax, eax
ret
