	.file	"5-9-3.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
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
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 65535
	mov	eax, DWORD PTR -4[rbp]
	lea	rdx, .LC0[rip]
	mov	esi, eax
	mov	rdi, rdx
	mov	eax, 0
	call	"printf"@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	"main", .-"main"
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
