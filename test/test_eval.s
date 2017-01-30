	.file	"test_eval.c"
	.globl	nodes
	.data
	.align 32
	.type	nodes, @object
	.size	nodes, 448
nodes:
	.long	6
	.long	0
	.long	0
	.long	0
	.long	6
	.long	1
	.long	1
	.long	0
	.long	5
	.long	1
	.long	0
	.long	0
	.long	5
	.long	0
	.long	1
	.long	0
	.long	4
	.long	0
	.long	2
	.long	0
	.long	4
	.long	1
	.long	2
	.long	0
	.long	4
	.long	3
	.long	0
	.long	0
	.long	4
	.long	2
	.long	1
	.long	0
	.long	4
	.long	1
	.long	0
	.long	0
	.long	4
	.long	2
	.long	0
	.long	0
	.long	4
	.long	1
	.long	3
	.long	0
	.long	4
	.long	3
	.long	2
	.long	0
	.long	4
	.long	3
	.long	1
	.long	0
	.long	3
	.long	4
	.long	0
	.long	0
	.long	3
	.long	5
	.long	0
	.long	0
	.long	3
	.long	5
	.long	6
	.long	0
	.long	3
	.long	7
	.long	8
	.long	0
	.long	3
	.long	2
	.long	9
	.long	0
	.long	3
	.long	10
	.long	2
	.long	0
	.long	3
	.long	5
	.long	11
	.long	0
	.long	3
	.long	12
	.long	5
	.long	0
	.long	2
	.long	13
	.long	14
	.long	0
	.long	2
	.long	15
	.long	16
	.long	0
	.long	2
	.long	17
	.long	18
	.long	0
	.long	2
	.long	19
	.long	20
	.long	0
	.long	1
	.long	21
	.long	22
	.long	0
	.long	1
	.long	23
	.long	24
	.long	0
	.long	0
	.long	25
	.long	26
	.long	0
	.comm	vals,6,1
	.text
	.globl	ceval
	.type	ceval, @function
ceval:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$nodes, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L3:
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$nodes, %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jne	.L2
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -5(%rbp)
	movl	-20(%rbp), %eax
	sall	$2, %eax
	movslq	%eax, %rdx
	movsbq	-5(%rbp), %rax
	addq	%rdx, %rax
	salq	$4, %rax
	addq	$nodes, %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
.L2:
	addl	$1, -4(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.L3
	movl	-20(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$nodes+4, %rax
	movl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	ceval, .-ceval
	.globl	make_vars
	.type	make_vars, @function
make_vars:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-32(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	-28(%rbp), %esi
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	andl	$1, %eax
	movb	%al, (%rdx)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	addl	$48, %eax
	movl	%eax, %edi
	call	putchar
	subl	$1, -4(%rbp)
.L6:
	cmpl	$0, -4(%rbp)
	jns	.L7
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	make_vars, .-make_vars
	.globl	make_ascii
	.type	make_ascii, @function
make_ascii:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L9
.L10:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	addl	$48, %edx
	movb	%dl, (%rax)
	addl	$1, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L10
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	make_ascii, .-make_ascii
	.globl	de_ascii
	.type	de_ascii, @function
de_ascii:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$48, %edx
	movb	%dl, (%rax)
	addl	$1, -4(%rbp)
.L12:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L13
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	de_ascii, .-de_ascii
	.section	.rodata
.LC0:
	.string	"int size:%d\n"
.LC1:
	.string	"Addresses: %p\t%p\t%p\n"
.LC2:
	.string	":%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$4, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$vals, %ecx
	movl	$nodes+16, %edx
	movl	$nodes+432, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movl	-4(%rbp), %eax
	movl	$6, %edx
	movl	%eax, %esi
	movl	$vals, %edi
	call	make_vars
	movl	$vals, %edx
	movl	$1, %esi
	movl	$27, %edi
	call	ceval
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -4(%rbp)
.L15:
	cmpl	$63, -4(%rbp)
	jle	.L16
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Debian 5.4.1-1) 5.4.1 20160803"
	.section	.note.GNU-stack,"",@progbits
