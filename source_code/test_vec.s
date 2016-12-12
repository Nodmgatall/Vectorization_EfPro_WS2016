	.file	"test_vec.cpp"
	.text
	.p2align 4,,15
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
	xorl	%eax, %eax
.L2:
	movups	(%rdi,%rax), %xmm0
	movups	(%rsi,%rax), %xmm1
	mulps	%xmm1, %xmm0
	movups	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$400000, %rax
	jne	.L2
	rep ret
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
