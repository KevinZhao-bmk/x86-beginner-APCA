;so as for now 
;if and else proved to be ok
;how about loop?
;how about if else with loop?
SECTION	.data
testnum: DD 3

SECTION .bss
var: RESD 1

SECTION .text
global _start
_start:

and DWORD [testnum], 0b1
cmp DWORD [testnum], 0b1
je Oddflag

Evenflag:
mov DWORD [var], 0b0
jmp End 

Oddflag:
mov DWORD [var], 0b1

End:

mov eax, 1
mov ebx, 0
int 80h
