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
;fmt:	db	"%ld?%ld:%ld",9,"%d",10,0
fmt:	db	"%lX %lX",10,0
fmt2:	db	"%s",10,0
	section .bss
buf:	resb	1024
fd:	resq	1

	section .text
extern printf
extern putchar
global main


;r15 			x[v]
;r14			node
;r13			next node
;r12			v
;r11			end of buf
main:
		;mov	r15d,[sinkF]		;get v of F sink
		mov	rdi,fname
		mov	rax,2			;open
		mov	rsi,0
		syscall
		mov	[fd],rax
		mov	rdi,[fd]
		mov	rsi,buf
		mov	rdx,r15
		mov	rax,0			;read
		syscall
		;mov	r11,rax		;r11 <= len



;		mov	r15,root
		;add	r11,buf - 1	;r11 += buf-1 : r11 -> buf[len-1]
		
		mov	r11,[sinkF]	;initialize r11 -> sinkF.v
		mov	r12,buf		;initialize r12 -> buf[0]
		mov	r14,root		;initialize r14 -> root
		mov	r10,[root]	;initialize r10 -> root.v
		mov	r13,root
		add	r13,4			;initialize r13 -> root.lo
		mov	r10,0			;initialize r10 -> v = 0
								;Everything inited. Ready to go?
_loop_head:					;Here begins a universal boolean solver :-/
		;push	qword [r12]
		cmp	r12,r11
		je		_loop_end
		inc	r12
		mov	r15,[r12]
		sub	r15,48
		mul	r15,4
		add	r13,r15		;offset r13 by 4 * x[v] => 0:lo, 4:hi
		add	r13,sinkF	;apply offset to pointerize r13

		jmp 	_loop_head
_loop_end:							;values of x have been pushed to the stack; buf is no longer needed
		


;		mov	rdi,[r12]
;		mov	rax,0
;		call	putchar
;		mov	rdi,10
;		mov	rax,0
;		call	putchar





;		mov	r14,r13
;		sub	r14,48			;ascii to boolean
;		mov	rax,4
;		mul	r14
;		add	rax,4
;		add	r15,rax
;		mov	rax,r15
;		add	rax,bot
;		mov	rsi,rax
;		mov	rax,0
;		mov	rsi,[r15]
;		mov	rdi,fmt
;		call	printf


;		mov	rax,0
;		mov	rdi,[r15]
;		call 	putchar


;		mov	rdx,rax
;		mov	rax,1			;write
;		mov	rdi,1			;stdout
;		syscall
		mov	rdi,fmt
		mov	r9,0
		mov	r10d,[root]
		mov	r11,[root+4]
;		mov	r12,[root+8]
		mov	r12d,[root+12]
;		add	r11,bot		;convert to absolute address
;		add	r12,bot		;				"

		mov	rsi,r15
;		mov	esi,[root]
;		mov	edx,[root+4]
;		mov	ecx,[root+8]
;		mov	r8d,[root+12]
		mov	rax,0
		call printf


		mov	rdi,[fd]
		mov	rax,3			;close
		syscall
		mov 	rdi,rax
		mov	rax,60
		syscall
	;	mov	[fd],rax
	;	ret

