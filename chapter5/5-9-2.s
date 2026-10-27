	.file	"5-9-2.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"C is the best programming language!"
	.text
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
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -12[rbp], 0
	lea	rax, .LC0[rip]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -16[rbp]
	movsxd	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 97
	jne	.L2
	add	DWORD PTR -12[rbp], 1
.L2:
	mov	eax, DWORD PTR -16[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -16[rbp], edx
	movsxd	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L3
	mov	eax, 0
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	"main", .-"main"
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
