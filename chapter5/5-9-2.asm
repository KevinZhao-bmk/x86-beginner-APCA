;This is for chapter5 5-9-2
;Strings ??? it will kill me definitly !
SECTION .data
str:
 DB "Assembly is the best programming language!",0ah
strlen: EQU ($ - str)

SECTION .text
global _start
_start:

mov eax, 0b0
mov ebx, 0b0
mov ecx, strlen
markdown:
cmp BYTE [str + eax], 0d97;So the first arg of cmp can't be a constant
jne Atest
inc ebx

Atest:
cmp BYTE [str + eax], 0d65
jne drop
inc ebx
drop:
inc eax
loop markdown


mov eax, 1
mov ebx, 0
int 80h
