	.file	"test_vec.cpp"
	.text
	.p2align 4,,15
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
	leaq	16(%rdi), %rcx
	leaq	16(%rdx), %rax
	cmpq	%rcx, %rdx
	setnb	%r8b
	cmpq	%rax, %rdi
	setnb	%cl
	orb	%cl, %r8b
	je	.L2
	leaq	16(%rsi), %rcx
	cmpq	%rcx, %rdx
	setnb	%cl
	cmpq	%rax, %rsi
	setnb	%al
	orb	%al, %cl
	je	.L2
	xorl	%eax, %eax
.L4:
	movups	(%rsi,%rax), %xmm0
	movups	(%rdi,%rax), %xmm1
	mulps	%xmm1, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$400000, %rax
	jne	.L4
	rep ret
	.p2align 4,,10
	.p2align 3
.L2:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	movss	%xmm0, (%rdx,%rax,4)
	addq	$1, %rax
	cmpq	$100000, %rax
	jne	.L5
	rep ret
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
