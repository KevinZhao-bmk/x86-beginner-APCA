SECTION .data
Maxt: DD 1000000
Sum: DD 2

SECTION .text
global _start
_start:

mov ebx, 1
mov edx, 1

febadd:
mov eax,0
add eax, ebx
add eax, edx

cmp eax, 0b1;to see if eax is odd
jp eaxdrop;failed for at least now
;8.26report:fixed now
;Turns out i just type it wrong x)
add DWORD [Sum], eax

eaxdrop:mov edx, ebx
mov ebx, eax

mov eax, DWORD [Sum]
cmp eax,  DWORD [Maxt]
jle febadd

mov eax, 1
mov ebx, 0
int 80h
