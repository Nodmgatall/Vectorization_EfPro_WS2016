	.file	"test.cpp"
	.text
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
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
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
