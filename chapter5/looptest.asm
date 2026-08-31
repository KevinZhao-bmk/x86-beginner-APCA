;This is for testing loop times 
;also for strlen test
section .data
str: db "This is a test string with a lenght of 41",0ah
strlen: equ $ - str
num: dd 0xffff
numlen: equ $ - num

section .bss
time: resd 1
length: resd 1
numstf: resb 16

section .text
global _start
_start:

mov ecx, strlen
xor eax, eax;so eax=0 at first,and each time it inc 
testloop:
inc eax
loop testloop

mov ecx, numlen
mov eax, dword [num]
mov ebx, 0d10
testnum:
xor edx, edx
div ebx
add edx, 0d48
mov byte [numstf + ecx], dl
loop testnum

check:
mov dword [time], eax
mov dword [length], strlen

done:
mov eax, 0d1
xor ebx, ebx
int 80h


