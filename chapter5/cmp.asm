;This is for config how cmp works
;Seemd quite hard so on 
;can't let it run normally till now
;And fuck i can't stand with my typing 
;fuck you my keyboard and myself!!!


;Fix in 8.22.2026
;Just some normal bug
;         x)   ---
SECTION .data
sum: DD 1000
num: DD 0

SECTION .text
global _start
_start:

;cmp DWORD [sum], DWORD [num]; cmp var and var seemed to be invalid :(
mov eax, DWORD [num]
cmp DWORD [sum], eax
jne markon

mov edx, 1140
markon:
mov eax, 1
mov ebx, 0
int 80h
