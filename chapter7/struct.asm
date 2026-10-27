;struct in nasm
struc person
 .name: resb 255
 .age: resd 1
 .size:
endstruc

section .data
employee1: istruc person
at person.name, db "Waldo"
at person.age, dd 55
iend

section .bss 
empArr: resb person.size*10
empSize: equ ($-empArr)/person.size

section .text
global _start
_start:
mov eax, 38
mov eax, [employee1 + person.age]

done:
mov eax, 1 
mov ebx, 0
int 80h
