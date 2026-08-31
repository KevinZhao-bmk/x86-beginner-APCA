;So this is the final test of chapter5
;seemed to be really hard
;hope i can pass it tonight
;8.23.2026
section .data
num: DD 0xffff
str: DB "Hello world!",0ah
strlen: equ ($ - str)

section .text
global _start
_start:

;testing write
mov eax, 4
mov ebx, 1
lea ecx, str
mov edx, strlen
int 80h

mov eax, 1
xor ebx, ebx
int 80h
