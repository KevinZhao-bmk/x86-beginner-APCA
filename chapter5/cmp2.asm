;So this is for testing cmp again
;for str things :(
SECTION .data
str: DB "aaaabbbbcccc"
strlen: equ ($ - str)

anum: DD 0
bnum: DD 0
cnum: DD 0

SECTION .text
global _start
_start:

mov ecx, strlen
mov eax, 0b0
test:
cmp BYTE [str + eax], 0d97
jne bt
inc DWORD [anum]

bt:
cmp BYTE [str + eax], 0d98
jne ct
inc DWORD [bnum]

ct:
cmp BYTE [str + eax], 0d99
jne ctf
inc DWORD [cnum]
ctf:
inc eax
loop test

mov eax, 1
mov ebx, 0
int 80h
