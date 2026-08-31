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
mov qword [arraysize], rax
pop rax

;for now we successfully input the buffer and pickup nums to the array
;LET'S DO THE POP SORT!

;to make things even worse, why not just pack pop_sort into a function?
lea rdi, [rel array]
lea rsi, [rel arraysize]
mov rdx, r12
call pop_sort
;assuming we do the sort,next step is to output the array
;(accually not check yet)

;oh damn we must add it 48d to every num or it can't be seen
;fork all this really drive me crazy

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
mov rax, 1
jmp deorad
descend:
xor rax, rax
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
;so you need to *8
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
push rbp;the rsi would be the arraysize
mov rbp, rsp;the rdx would  be r12, 1:means ascend
xor r8, r8;r8 would be the i
xor r9, r9;j
ilay:;how about pack compare into another function?
lea rax, qword [array + r8*8]
mov r9, r8
jlay:;this would be the worst idea i could ever come up with
push rdi
push rsi
mov rdi, rax
lea rsi, qword [array + r9*8]
call compare
pop rdi
pop rsi
inc r9
cmp r9, rsi
jae jlaydone
jmp jlay

jlaydone:
inc r8 
cmp r8, rsi
jae ilaydone
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
mov qword [rsi], r13;mystical swap
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
