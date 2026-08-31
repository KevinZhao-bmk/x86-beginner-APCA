section .bss
buffer: resb 64

section .text
global _start, _addf
_start:
mov eax, 0xffff
mov ebx, 0xab01
add eax, ebx
pushfd
push buffer
call _addf
add esp, 8d

done:
mov eax, 1d
xor ebx, ebx
int 80h

_addf:
push ebp
mov ebp, esp
mov ecx, 20h
mov eax, [ebp + 12]
mov ebx, [ebp + 8]
fill:
mov edx, eax
and edx, 1
add edx, 0x30
mov byte [ebx + ecx], dl
shr eax, 1d
loop fill
pop ebp
ret
