#cmps in nasm version
section .data
src: db "This is a test",0
lensrc: equ $-src
dst: db "This iS a test",0
lendst: equ $-src

section .text
global _start
_start:

mov eax, lensrc
cmp lendst, eax
jne notequal

lea esi, [src]
lea edi, [dst]
mov ecx, lensrc
cld 
repe cmpsb

jnz notequal
jmp done
notequal:

done:
mov eax, 1
mov ebx, 0
int 80h
