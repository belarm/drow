global args
extern printf
	section .data
fmt:	db	'rax=%lX',10,'rdi=%lX',10,'rsi=%lX',10,'rdx=%lX',10
	section .text
args:	mov	rcx,rax
	mov	r8,rdx
	mov	rcx,rsi
	mov	rdx,rdi
	mov	rsi,rax
	mov	rax,0
	mov	rdi,fmt
	call	printf
	ret

