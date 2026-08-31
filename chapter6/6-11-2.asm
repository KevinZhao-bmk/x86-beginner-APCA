;so this is for homework 6.11.2 basic eflags
section .data
msg: db "The eflags would be:"
msglen:equ $-msg
msgbf: db " after the"
msgbflen:equ $-msgbf
msgadd: db " add."
msgaddlen:equ $-msgadd

newline: db 0ah
num1: dd 0
num2: dd 0

section .bss
buffer: resb 64

section .text
global _start, _out, _in, _divnum, _eflagsadd 

_start:
;get the two nums first
push buffer
push 64d
call _in
add esp, 8d

;now the divi things comes again
;_divnum access a buffer and a bufferlength
;and give the num in eax
xor edx, edx
push num1
push buffer
push 64d
call _divnum
add esp, 12d
picknum1done:

push num2
push buffer
push 64d
call _divnum
add esp, 12d
picknum2done:

;so lets add first
mov eax, dword [num1]
mov ebx, dword [num2]
add eax, ebx
;next, i have to add eflags and _out it

;the length of the eflags would be in ecx
push buffer
pushfd 
mov ecx, 0x20 
call _eflagsadd
add esp, 8h
;so after this eflags must in buffer and ready to out

;for unknow reason i probably have to set buffer[0] zero
xor al, al
mov byte [buffer], al

push msg;and this is for msg out
push msglen
call _out
add esp, 8h

push buffer 
push 64d
call _out
add esp, 8d

push msgbf
push msgbflen
call _out
add esp, 8h

push msgadd
push msgaddlen
call _out
add esp, 8d

done:
mov eax, 1d
xor ebx, ebx
int 80h;finish in 8.29.2026
;maybe there would be 64bit version in the future

_in:
push ebp
mov ebp, esp
mov eax, 3d
xor ebx, ebx
mov ecx, [ebp + 12]
mov edx, [ebp + 8]
int 80h
pop ebp
ret

_out:
push ebp
mov ebp, esp
mov eax, 4d
mov ebx, 1d
mov ecx, [ebp + 12]
mov edx, [ebp + 8]
int 80h
pop ebp
ret

_divnum:
push ebp
mov ebp, esp
mov ebx, [ebp + 12]

exNum:
mov al, byte [ebx + edx]
cmp al, 48d
jb notnum
cmp al, 57d
ja notnum
jmp Num

notnum:
inc edx
jmp exNum

Num:
cmp edx, [ebx + 8]
ja divnumdone

sub al,48d
mov ecx, [ebp + 16]
mov ecx, [ecx]
imul ecx, ecx, 10d
movzx eax, al
add ecx, eax 
mov eax, [ebp + 16]
mov dword [eax], ecx;Be ware of the pointers!
inc edx
mov al, byte [ebx + edx]
cmp al, 48d
jb divnumdone
cmp al, 57d
ja divnumdone
jmp Num

divnumdone:
pop ebp
ret

_eflagsadd:
push ebp
mov ebp, esp
mov eax, [ebp + 12]
mov edx, [ebp + 8]
fill01:
mov ebx, edx
and ebx, 1
add ebx, 48d
;movxz bl, ebx
mov byte [eax + ecx], bl
shr edx, 1
loop fill01
pop ebp
ret
