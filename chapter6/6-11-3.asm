;shit this is a pop sort 
;quite hard
section .data
section .bss
buffer: resb 4096
;stdin would be descend/ascend arraysize array
array: resq 512
arraysize: resq 1

section .text
global _start, deora
_start:
;got the buffer first
xor rax, rax
xor rdi, rdi
lea rsi, [rel buffer]
mov rdx, 4096d
syscall
;so for now the length of input is in rax
;call deora
;deora search for the first word to see it is descend or ascend
push rax
lea rdi, [rel buffer]
call deora
mov r12, rax;r12=1 means to ascend
pop rax

;call picknum 
lea rdi, [rel buffer]
mov rsi, rax
lea rdx, [rel array]
push rax
call picknum
;this time,picknum access a array and fill the arry with all nums it get
mov qword [rel arraysize], rax
pop rax

;for now we successfully input the buffer and pickup nums to the array
;LET'S DO THE POP SORT!

;to make things even worse, why not just pack pop_sort into a function?
lea rdi, [rel array]
lea rsi, [rel arraysize]
mov rdx, r12
call pop_sort
;can't believe i have done this
;so let's just output the array,wuuuuuuuuuuuh

;for the output ,rdi<-buffer,rsi<-array,rdx<-arraylen
;seemed i haven't done any error check 
;but who cares, errors didn't hurt me
lea rdi, [rel buffer]
lea rsi, [rel array]
lea rdx, [rel arraysize];maybe i should push rax,but seemed rax didn't store some usefull data
call output
;so if i call a cpp function, maybe i should push some registers
;so just push at the time i use cpp functions x)

done:
mov rax, 60d
xor rdi, rdi
syscall

deora:
push rbp
mov rbp, rsp
mov r8b, byte [rdi]
cmp r8b, 97d
je ascend
cmp r8b, 65d
je ascend
cmp r8b, 100d
je descend
cmp r8b, 68d
je descend
ascend:
xor rax, rax
jmp deorad
descend:
mov rax, 1
deorad:
pop rbp
ret


picknum:;so the rdi<-buffer rsi<-length rdx<-array
push rbp
mov rbp, rsp 
push rbx
xor rbx, rbx;rbx would be signal for trans between nums and notnums
xor rcx, rcx;rcx would be the index of buffer
xor rax, rax;rax would be the index of array
xor rbx, rbx
xor r8, r8;r8 would be the buffer of the buffer
pick:
;notise that array: resq 512
;so i need to *8
cmp rcx, rsi
ja picknumdone;to check if rcx go out

mov r8b, byte [rdi + rcx]
cmp r8b, 48d
jb notnum
cmp r8b, 57d
ja notnum
jmp num
notnum:
inc rcx
cmp rbx, 0
je pick;rbx=0 means the last buffer is notnum
inc rax;so nothing happened ,just inc rcx and goto pick
xor rbx, rbx;if rbx=1 means the last buffer is num, and this buffer is notnum
jmp pick;so inc rax, and goto pick

num:
inc rbx
sub r8b, 48d
mov r9, qword [rdx + rax*8]
imul r9, r9, 10d
movzx r8, r8b
add r9, r8
mov qword [rdx + rax*8], r9
inc rcx
cmp rcx, rsi
jb pick

picknumdone:
pop rbx
pop rbp
ret

pop_sort:;so the rdi would be the array
push rbp;the rsi would be the &arraysize
mov rbp, rsp;the rdx would  be r12, 1:means ascend
xor r8, r8;r8 would be the i
xor r9, r9;j
ilay:;how about pack compare into another function?
cmp r8, qword [rsi]
jae ilaydone
lea rax, qword [array + r8*8]
mov r9, r8
inc r9
jlay:;this would be the worst idea i could ever come up with
cmp r9, qword [rsi]
jae jlaydone
push rdi
push rsi
mov rdi, rax
lea rsi, qword [array + r9*8]
call compare
pop rsi 
pop rdi 
inc r9
jmp jlay

jlaydone:
inc r8 
jmp ilay

ilaydone:
pop rbp
ret

compare:
;so in this function,rdi would be &array[i],and rsi would be &array[j]
;and rdx would be r12:1:ascend
push rbp
mov rbp, rsp
push r12;this would be the temp
push r13;this would be the array[i]
push r14;this would be the array[j]
mov r13, qword [rdi]
mov r14, qword [rsi]
cmp rdx, 1
je swapascend
jmp swapdescend
swapascend:
cmp r13, r14
jb swapdone
mov qword [rdi], r14
mov qword [rsi], r13;mystical swap;can accually work for unknow reason
jmp swapdone

swapdescend:
cmp r13, r14
ja swapdone
mov qword [rdi], r14
mov qword [rsi], r13

swapdone:
pop r14
pop r13
pop r12
pop rbp
ret

output:;rdi<-buffer ,rsi<-array rdx<-&arraysize,
push rbp
mov rbp, rsp
xor r8, r8;index of buffer
xor r9, r9;index of array
mov rcx, rdx;mov &arraysize to rcx temporaily x)))
push rbx
mov rbx, 10d
preoutput:;damn this still have bugs
mov rax, [rsi + 8*r9]
divrax:
xor rdx, rdx;does this necessary?
div rbx
add rdx, 48d
mov byte [rdi + r8], dl
inc r8
cmp rax, 0
jne divrax
mov byte [rdi + r8], 32d
inc r8
inc r9
cmp r9, qword [rcx]
jae preoutputdone
jmp preoutput

preoutputdone:
;a reverse is needed
dec r8
dec r8
push r8
xor r9, r9
reverse:
mov al, byte [rdi + r8]
mov bl, byte [rdi + r9]
mov byte [rdi + r8], bl 
mov byte [rdi + r9], al
inc r9
dec r8
cmp r9, r8
jae outputdone
jmp reverse

outputdone:
mov rax, 1
mov rsi, rdi
mov rdi, 1
pop rdx
inc rdx
syscall

pop rbx
pop rbp
ret
