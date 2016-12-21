	.file	"test_vec.cpp"
	.text
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
	leaq	16(%rdx), %rax
	leaq	16(%rdi), %rcx
	cmpq	%rcx, %rdx
	setnb	%r8b
	cmpq	%rdi, %rax
	setbe	%cl
	orb	%cl, %r8b
	je	.L13
	leaq	16(%rsi), %rcx
	cmpq	%rcx, %rdx
	setnb	%cl
	cmpq	%rsi, %rax
	setbe	%al
	orb	%al, %cl
	je	.L13
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
	je	.L3
	movl	$0, %eax
	movl	$100000, %r8d
.L4:
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	addss	(%rdx,%rax,4), %xmm0
	movss	%xmm0, (%rdx,%rax,4)
	addq	$1, %rax
	movq	%r8, %r11
	subq	%rax, %r11
	cmpq	%rax, %rcx
	jne	.L4
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
	jbe	.L6
	jmp	.L12
.L13:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	movl	$0, %eax
.L2:
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	addss	(%rdx,%rax,4), %xmm0
	movss	%xmm0, (%rdx,%rax,4)
	addq	$1, %rax
	cmpq	$100000, %rax
	jne	.L2
	rep ret
.L3:
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	movl	$100000, %ebp
	subq	%rcx, %rbp
	movl	$99996, %r9d
	subq	%rcx, %r9
	shrq	$2, %r9
	addq	$1, %r9
	leaq	0(,%r9,4), %r12
	movq	%rcx, %rax
	movl	$100000, %r11d
.L12:
	salq	$2, %rcx
	leaq	(%rdx,%rcx), %rbx
	leaq	(%rsi,%rcx), %r13
	addq	%rdi, %rcx
	movl	$0, %r8d
	movl	$0, %r10d
.L8:
	movups	0(%r13,%r8), %xmm0
	movups	(%rcx,%r8), %xmm1
	mulps	%xmm1, %xmm0
	addps	(%rbx,%r8), %xmm0
	movaps	%xmm0, (%rbx,%r8)
	addq	$1, %r10
	addq	$16, %r8
	cmpq	%r9, %r10
	jb	.L8
	addq	%r12, %rax
	subq	%r12, %r11
	cmpq	%rbp, %r12
	je	.L1
.L6:
	addq	%rax, %r11
.L10:
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	addss	(%rdx,%rax,4), %xmm0
	movss	%xmm0, (%rdx,%rax,4)
	addq	$1, %rax
	cmpq	%r11, %rax
	jne	.L10
.L1:
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
