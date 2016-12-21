	.file	"test-main.cpp"
	.section	.text._Z4fillIfEvPT_j,"axG",@progbits,_Z4fillIfEvPT_j,comdat
	.p2align 4,,15
	.weak	_Z4fillIfEvPT_j
	.type	_Z4fillIfEvPT_j, @function
_Z4fillIfEvPT_j:
.LFB2339:
	.cfi_startproc
	testl	%esi, %esi
	je	.L9
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	leaq	4(%rdi,%rax,4), %r12
	.p2align 4,,10
	.p2align 3
.L4:
	call	rand
	movl	%eax, %ebx
	addq	$4, %rbp
	call	rand
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	%ebx, %xmm0
	cvtsi2ss	%eax, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	cmpq	%r12, %rbp
	jne	.L4
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
.L9:
	rep ret
	.cfi_endproc
.LFE2339:
	.size	_Z4fillIfEvPT_j, .-_Z4fillIfEvPT_j
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sizeof float: "
.LC3:
	.string	"Calculated "
.LC4:
	.string	" additions"
.LC5:
	.string	" times :in:"
.LC6:
	.string	"    "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB2111:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$14, %edx
	movl	$.LC0, %esi
	movl	$_ZSt4cout, %edi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	$400016, %ebx
	subq	$24, %rsp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$4, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSo9_M_insertImEERSoT_
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	subq	%rbx, %rsp
	movl	$100000, %esi
	movq	%rsp, %rdi
	movq	%rsp, %r14
	call	_Z4fillIfEvPT_j
	subq	%rbx, %rsp
	movl	$100000, %esi
	movq	%rsp, %rdi
	movq	%rsp, %r13
	call	_Z4fillIfEvPT_j
	subq	%rbx, %rsp
	movl	$399996, %edx
	xorl	%esi, %esi
	leaq	3(%rsp), %r15
	movl	$1000, %ebx
	shrq	$2, %r15
	leaq	0(,%r15,4), %r12
	movl	$0x00000000, 0(,%r15,4)
	leaq	4(%r12), %rdi
	call	memset
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movq	%rax, -56(%rbp)
	.p2align 4,,10
	.p2align 3
.L12:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	_Z4testPfS_S_
	subq	$1, %rbx
	jne	.L12
	pxor	%xmm0, %xmm0
	movl	$_ZSt4cout, %edi
	cvtss2sd	936(,%r15,4), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	call	_ZNSt6chrono3_V212system_clock3nowEv
	subq	-56(%rbp), %rax
	pxor	%xmm0, %xmm0
	movl	$11, %edx
	movl	$.LC3, %esi
	movl	$_ZSt4cout, %edi
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$100000, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$10, %edx
	movq	%rax, %rbx
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbx, %rdi
	movl	$1000, %esi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$11, %edx
	movq	%rax, %rbx
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbx, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	movl	$4, %edx
	movl	$.LC6, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movsd	-56(%rbp), %xmm0
	movl	$_ZSt4cout, %edi
	call	_ZNSo9_M_insertIdEERSoT_
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2111:
	.size	main, .-main
	.p2align 4,,15
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2577:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE2577:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",@progbits
