	.file	"5-9-1.c"
	.intel_syntax noprefix
	.text
	.globl	"Maxt"
	.section	.rodata
	.align 4
	.type	"Maxt", @object
	.size	"Maxt", 4
"Maxt":
	.long	1000000
	text
	.globl	"main"
	.type	"main", @function
"main":
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -16[rbp], 2
	mov	DWORD PTR -12[rbp], 1
	mov	DWORD PTR -8[rbp], 1
	mov	DWORD PTR -4[rbp], 2
	jmp	.L2
.L3:
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	mov	DWORD PTR -4[rbp], eax
	mov	edx, DWORD PTR -4[rbp]
	mov	eax, edx
	sar	eax, 31
	shr	eax, 31
	add	edx, eax
	and	edx, 1
	sub	edx, eax
	mov	eax, edx
	cmp	eax, 1
	jne	.L2
	mov	eax, DWORD PTR -4[rbp]
	add	DWORD PTR -16[rbp], eax
.L2:
	mov	eax, 1000000
	cmp	DWORD PTR -16[rbp], eax
	jl	.L3
	mov	eax, 0
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	"main", .-"main"
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
