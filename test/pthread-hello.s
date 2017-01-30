	.file	"pthread-hello.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Hello World! It's me, thread #%ld!\n"
	.text
	.globl	PrintHello
	.type	PrintHello, @function
PrintHello:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %edi
	call	pthread_exit
	.cfi_endproc
.LFE2:
	.size	PrintHello, .-PrintHello
	.section	.rodata
.LC1:
	.string	"In main: creating thread %ld\n"
	.align 8
.LC2:
	.string	"ERROR; return code from pthread_create() is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L3
.L5:
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-8(%rbp), %rax
	leaq	-64(%rbp), %rdx
	movq	-8(%rbp), %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rdi
	movq	%rax, %rcx
	movl	$PrintHello, %edx
	movl	$0, %esi
	call	pthread_create
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L4
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %edi
	call	exit
.L4:
	addq	$1, -8(%rbp)
.L3:
	cmpq	$4, -8(%rbp)
	jle	.L5
	movl	$0, %edi
	call	pthread_exit
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Debian 6.1.1-11) 6.1.1 20160802"
	.section	.note.GNU-stack,"",@progbits
