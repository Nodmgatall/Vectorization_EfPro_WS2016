	.file	"test_restrict.cpp"
	.text
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rcx
	shrq	$2, %rcx
	negq	%rcx
	andl	$3, %ecx
	je	.L2
	movl	$0, %eax
	movl	$100000, %r8d
.L3:
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	addss	(%rdx,%rax,4), %xmm0
	movss	%xmm0, (%rdx,%rax,4)
	addq	$1, %rax
	movq	%r8, %r11
	subq	%rax, %r11
	cmpq	%rax, %rcx
	jne	.L3
	cmpq	$100000, %rax
	je	.L1
	movl	$100000, %ebp
	subq	%rcx, %rbp
	movl	$99996, %r9d
	subq	%rcx, %r9
	shrq	$2, %r9
	addq	$1, %r9
	leaq	0(,%r9,4), %r12
	movl	$99999, %r8d
	subq	%rcx, %r8
	cmpq	$2, %r8
	jbe	.L5
	jmp	.L10
.L2:
	movl	$100000, %ebp
	subq	%rcx, %rbp
	movl	$99996, %r9d
	subq	%rcx, %r9
	shrq	$2, %r9
	addq	$1, %r9
	leaq	0(,%r9,4), %r12
	movq	%rcx, %rax
	movl	$100000, %r11d
.L10:
	salq	$2, %rcx
	leaq	(%rdx,%rcx), %rbx
	leaq	(%rsi,%rcx), %r13
	addq	%rdi, %rcx
	movl	$0, %r8d
	movl	$0, %r10d
.L7:
	movups	0(%r13,%r8), %xmm0
	movups	(%rcx,%r8), %xmm1
	mulps	%xmm1, %xmm0
	addps	(%rbx,%r8), %xmm0
	movaps	%xmm0, (%rbx,%r8)
	addq	$1, %r10
	addq	$16, %r8
	cmpq	%r9, %r10
	jb	.L7
	addq	%r12, %rax
	subq	%r12, %r11
	cmpq	%rbp, %r12
	je	.L1
.L5:
	addq	%rax, %r11
.L9:
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	addss	(%rdx,%rax,4), %xmm0
	movss	%xmm0, (%rdx,%rax,4)
	addq	$1, %rax
	cmpq	%r11, %rax
	jne	.L9
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
