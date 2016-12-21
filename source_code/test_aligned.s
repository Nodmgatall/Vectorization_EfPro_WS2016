	.file	"test_aligned.cpp"
	.text
	.globl	_Z4testPfS_S_
	.type	_Z4testPfS_S_, @function
_Z4testPfS_S_:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
.L2:
	movaps	(%rsi,%rax), %xmm0
	mulps	(%rdi,%rax), %xmm0
	addps	(%rdx,%rax), %xmm0
	movaps	%xmm0, (%rdx,%rax)
	addq	$16, %rax
	cmpq	$400000, %rax
	jne	.L2
	rep ret
	.cfi_endproc
.LFE0:
	.size	_Z4testPfS_S_, .-_Z4testPfS_S_
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
