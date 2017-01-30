	section .data
fname	db	'variables.dat',0
sinkF:	dd 6,0,0,0
sinkT:	dd 6,1,1,0
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
fmt:	db	"%lX %lX",10,0
fmt2:	db	"%s",10,0
	section .bss
buf:	resb	1024
fd:	resq	1

	section .text
extern printf
extern putchar
global main


main:
			mov	r15,[sinkF]
		mov	rdi,fname
		mov	rax,2			;open()
		mov	rsi,0
		syscall
		mov	[fd],rax
		mov	rdi,[fd]
		mov	rsi,buf
		mov	rdx,r15
		mov	rax,0			;read()
		syscall
	;==Initialization==	
		mov	r10,0			;v=0
		mov	r11,[sinkF]	;sinkF.v
		mov	r12,buf		;*buf[0]
		mov	r13,root+4	;*root.lo
		mov	r14,root		;*root
	;Everything inited. Ready to go?
_loop_head:					;Here begins a universal boolean solver :-/
;		mov	r9,[r14]
		cmp	r10d,[r14]	; v ? node.v
		jl		_e1
		mov	r15b,[r12]	; =x[v]+48
		sub	r15,48
		shl	r15,2
		add	r13,r15
;		add	r13,sinkF
		mov	r14,[r13]
		add	r14,sinkF
		cmp	r14,sinkT
		jle	_done
		mov	r13,r14
		add	r13,4
_e1:
		inc	r10
		inc	r12
		jmp 	_loop_head

_done:
	;cleanup and quit
		mov	rdi,[fd]
		mov	rax,3			;close()
		syscall
		mov 	rdi,rax
		mov	rax,60		;exit()
		syscall


_print:

