;This is a test to see how 
;to fill an array
section .data
stuffs: db 48,49,50,51,52,53,54
stufflen: equ ($ - stuffs)

section .bss
box: resb 7

section .text
global _start
_start:

mov ecx, stufflen
fill:
;mov BYTE [box + ecx], BYTE [stuffs + ecx]
;seemed moving a var from another var is invalid?
mov al, BYTE [stuffs + ecx]
mov BYTE [box + ecx],al 
loop fill

done:
mov eax, 1
xor ebx, ebx
int 80h

