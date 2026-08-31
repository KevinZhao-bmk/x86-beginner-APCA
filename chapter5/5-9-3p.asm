;This is another attempt for 5-9-3
;Because i failed last night x)
;so the usage of syscall write
;is like do eax<-4 ebx<-1 
;and ecx<-the address of the start of the str
;edx<-the lenght of the str
;that make sence :|
section .data
num: DD 0xffff
numlen: equ ($ - num)

section .bss
str: RESB 16;so this might be the buffer of syscall write?
;and str means its first address??
;btw can i write RESB in lower case?;--yes i can.

section .text
global _start
_start:

;so i have to div num in 10
;like i do a lot of times in C
;and the div and give us the result
mov eax, DWORD [num]
mov ecx, numlen
inc ecx
mov ebx, 0d10

pickagain:
xor edx, edx
div ebx
;so it really works!
;now i got 0d5
;damn this is forking good
add edx, 0d48
mov BYTE [str + ecx], dl ;tures out i can't just mov a 32bit reg to a 8bit var x)

;so now the num is add by '0' and send to the str
;maybe it's time for the next round?
pickcheck:
loop pickagain

;so if it get to here ,then every thing should be done.
;just do the syscall write!
mov eax, 0d4
mov ebx, 0d1
mov ecx, str
mov edx, numlen 
inc edx;for unknow rease ,edx must add by 2
inc edx;probably numlen need 1 
;i need to check the strlen calculation
;and the loop time in ecx
int 80h

;at least this is finised now x)
done:
mov eax, 1
xor ebx, ebx
int 80h
