extern printf
	section .data
fmt:	db	"%X",10,0
bot:	dd 6,0,0,0
		dd 6,1,1,0
		dd 5,1,0,0
		dd 5,0,1,0
		dd 4,0,2,0
		dd 4,1,2,0
		dd 4,3,0,0
		dd 4,2,1,0
		dd 4,1,0,0
		dd 4,2,0,0
		dd 4,1,3,0
		dd 4,3,2,0
		dd 4,3,1,0
		dd 3,4,0,0
		dd 3,5,0,0
		dd 3,5,6,0
		dd 3,7,8,0
		dd 3,2,9,0
		dd 3,10,2,0
		dd 3,5,11,0
		dd 3,12,5,0
		dd 2,13,14,0
		dd 2,15,16,0
		dd 2,17,18,0
		dd 2,19,20,0
		dd 1,21,22,0
		dd 1,23,24,0
root:	dd 0,25,26,0
	section .text
global	main
main:
	push 	rbp
	mov 	rdi,fmt
	mov 	rsi,rax	;rdi, rsi, rdx, rcx, r9, r10...
	mov 	rax,0
	call 	printf
	mov	rsi,rdi
	mov	rdi,fmt
;	mov	rsi,rbx
	mov	rax,0
	call	printf
	pop	rbp
	mov	rax,0
	ret
