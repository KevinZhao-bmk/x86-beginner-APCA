;# another try struct in nasm
struc vector
 .re resd 1
 .im resd 1
 .arg resb 1
 .mod resd 1
 .size:
endstruc

section .data
vec1: istruc vector
at vector.re, dd 3
at vector.im, dd 4
at vector.arg, db 57
iend

section .text
global _start
_start:

mov eax, [rel vec1 + vector.im]
mov ebx, [rel vec1 + vector.arg]

done:
mov rax, 60
mov rdi, 0
syscall
