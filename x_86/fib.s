	.file	"fib.c"
	.text
	.comm	clk1,8,8
	.comm	clk2,8,8
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movsd	%xmm0, -40(%rbp)
	pxor	%xmm0, %xmm0
	ucomisd	-40(%rbp), %xmm0
	jp	.L2
	pxor	%xmm0, %xmm0
	ucomisd	-40(%rbp), %xmm0
	jne	.L2
	pxor	%xmm0, %xmm0
	jmp	.L4
.L2:
	movsd	.LC1(%rip), %xmm0
	ucomisd	-40(%rbp), %xmm0
	jp	.L12
	movsd	.LC1(%rip), %xmm0
	ucomisd	-40(%rbp), %xmm0
	je	.L5
.L12:
	movsd	-40(%rbp), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jp	.L7
	movsd	-40(%rbp), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jne	.L7
.L5:
	movsd	.LC1(%rip), %xmm0
	jmp	.L4
.L7:
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	jmp	.L9
.L10:
	movsd	-16(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-16(%rbp), %xmm0
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
.L9:
	movsd	-40(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	subsd	%xmm1, %xmm0
	comisd	-32(%rbp), %xmm0
	ja	.L10
	movsd	-16(%rbp), %xmm0
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	fibonacci, .-fibonacci
	.section	.rodata
.LC3:
	.string	"%d "
.LC4:
	.string	"%f\n"
	.align 8
.LC6:
	.string	"The time taken by the program on CPU using loop is %f"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	clock@PLT
	movq	%rax, clk1(%rip)
	movl	$0, -8(%rbp)
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cvtsi2sdl	-8(%rbp), %xmm0
	call	fibonacci
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L14:
	cmpl	$100, -8(%rbp)
	jle	.L15
	call	clock@PLT
	movq	clk1(%rip), %rdx
	subq	%rdx, %rax
	movq	%rax, clk2(%rip)
	movq	clk2(%rip), %rax
	cvtsi2ssq	%rax, %xmm0
	movss	.LC5(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	cvtss2sd	-4(%rbp), %xmm0
	leaq	.LC6(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.align 4
.LC5:
	.long	1232348160
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
