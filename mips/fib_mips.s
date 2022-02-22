	.file	1 "fib.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text

	.comm	clk1,4,4

	.comm	clk2,4,4
	.align	2
	.globl	fibonacci
	.set	nomips16
	.set	nomicromips
	.ent	fibonacci
	.type	fibonacci, @function
fibonacci:
	.frame	$fp,40,$31		# vars= 32, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$fp,36($sp)
	move	$fp,$sp
	sdc1	$f12,40($fp)
	ldc1	$f0,40($fp)
	mtc1	$0,$f2
	mthc1	$0,$f2
	c.eq.d	$fcc0,$f0,$f2
	bc1f	$fcc0,$L2
	nop

	mtc1	$0,$f0
	mthc1	$0,$f0
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L2:
	ldc1	$f2,40($fp)
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	c.eq.d	$fcc1,$f2,$f0
	bc1t	$fcc1,$L4
	nop

	ldc1	$f2,40($fp)
	lui	$2,%hi($LC1)
	ldc1	$f0,%lo($LC1)($2)
	c.eq.d	$fcc2,$f2,$f0
	bc1f	$fcc2,$L5
	nop

$L4:
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L5:
	sw	$0,4($fp)
	sw	$0,0($fp)
	sw	$0,12($fp)
	sw	$0,8($fp)
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	sdc1	$f0,16($fp)
	.option	pic0
	b	$L6
	nop

	.option	pic2
$L7:
	ldc1	$f0,16($fp)
	sdc1	$f0,24($fp)
	ldc1	$f2,16($fp)
	ldc1	$f0,8($fp)
	add.d	$f0,$f2,$f0
	sdc1	$f0,16($fp)
	ldc1	$f0,24($fp)
	sdc1	$f0,8($fp)
	ldc1	$f2,0($fp)
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	add.d	$f0,$f2,$f0
	sdc1	$f0,0($fp)
$L6:
	ldc1	$f2,40($fp)
	lui	$2,%hi($LC0)
	ldc1	$f0,%lo($LC0)($2)
	sub.d	$f0,$f2,$f0
	ldc1	$f2,0($fp)
	c.lt.d	$fcc3,$f2,$f0
	bc1t	$fcc3,$L7
	nop

	ldc1	$f0,16($fp)
$L3:
	move	$sp,$fp
	lw	$fp,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	fibonacci
	.size	fibonacci, .-fibonacci
	.rdata
	.align	2
$LC2:
	.ascii	"%d \000"
	.align	2
$LC3:
	.ascii	"%f\012\000"
	.align	2
$LC5:
	.ascii	"The time taken by the program on CPU using loop is %f\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	lw	$2,%got(clk1)($28)
	sw	$3,0($2)
	sw	$0,24($fp)
	.option	pic0
	b	$L9
	nop

	.option	pic2
$L10:
	lw	$5,24($fp)
	lui	$2,%hi($LC2)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	mtc1	$2,$f0
	cvt.d.w	$f0,$f0
	mov.d	$f12,$f0
	.option	pic0
	jal	fibonacci
	nop

	.option	pic2
	lw	$28,16($fp)
	mfc1	$7,$f0
	mfhc1	$6,$f0
	lui	$2,%hi($LC3)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L9:
	lw	$2,24($fp)
	slt	$2,$2,101
	bne	$2,$0,$L10
	nop

	lw	$2,%call16(clock)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,clock
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$3,$2
	lw	$2,%got(clk1)($28)
	lw	$2,0($2)
	subu	$3,$3,$2
	lw	$2,%got(clk2)($28)
	sw	$3,0($2)
	lw	$2,%got(clk2)($28)
	lw	$2,0($2)
	mtc1	$2,$f0
	cvt.s.w	$f2,$f0
	lui	$2,%hi($LC4)
	lwc1	$f0,%lo($LC4)($2)
	div.s	$f0,$f2,$f0
	swc1	$f0,28($fp)
	lwc1	$f0,28($fp)
	cvt.d.s	$f0,$f0
	mfc1	$7,$f0
	mfhc1	$6,$f0
	lui	$2,%hi($LC5)
	addiu	$4,$2,%lo($LC5)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.rdata
	.align	3
$LC0:
	.word	1072693248
	.word	0
	.align	3
$LC1:
	.word	1073741824
	.word	0
	.align	2
$LC4:
	.word	1232348160
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
