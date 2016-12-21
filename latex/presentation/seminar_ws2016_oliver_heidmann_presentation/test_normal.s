	.file	"test_normal.cpp"
	.data
	.align 8
	.type	_ZL11vector_size, @object
	.size	_ZL11vector_size, 8
_ZL11vector_size:
	.quad	100000
	.text
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -8(%rbp)
.L3:
	movq	_ZL11vector_size(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jnb	.L4
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-32(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm1
	movq	-8(%rbp), %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movss	(%rdx), %xmm0
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	addq	$1, -8(%rbp)
	jmp	.L3
.L4:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
