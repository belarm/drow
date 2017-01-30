DEFAULT REL
	section .data
nodes:	dd 6,0+nodes,0+nodes,0
sinkT:	dd 6,nodes + 16,nodes + 16,0
	dd 5,nodes + 16,nodes + 0,0
	dd 5,nodes + 0,nodes + 16,0
	dd 4,nodes + 0,nodes + 32,0
	dd 4,nodes + 16,nodes + 32,0
	dd 4,nodes + 48,nodes + 0,0
	dd 4,nodes + 32,nodes + 16,0
	dd 4,nodes + 16,nodes + 0,0
	dd 4,nodes + 32,nodes + 0,0
	dd 4,nodes + 16,nodes + 48,0
	dd 4,nodes + 48,nodes + 32,0
	dd 4,nodes + 48,nodes + 16,0
	dd 3,nodes + 64,nodes + 0,0
	dd 3,nodes + 80,nodes + 0,0
	dd 3,nodes + 80,nodes + 96,0
	dd 3,nodes + 112,nodes + 128,0
	dd 3,nodes + 32,nodes + 144,0
	dd 3,nodes + 160,nodes + 32,0
	dd 3,nodes + 80,nodes + 176,0
	dd 3,nodes + 192,nodes + 80,0
	dd 2,nodes + 208,nodes + 224,0
	dd 2,nodes + 240,nodes + 256,0
	dd 2,nodes + 272,nodes + 288,0
	dd 2,nodes + 304,nodes + 320,0
	dd 1,nodes + 336,nodes + 352,0
	dd 1,nodes + 368,nodes + 384,0
root:	dd 0,nodes + 400,nodes + 416,0
vars:	db 1,1,1,0,1,0
fmt:	db '%d',9,'%d',9,'%d',10
	section .text
	global _start
	global eval
	extern printf
eval:
	;args are in rdi,rsi,rdx
	;rdi = node *nodes (array)
	;rsi = root index = next
	;rdx = char *vars (array of 0&1) will be incremented in each loop
	;r13 = copy of *nodes
	;r12 = vmax
	;r11 = *cur
	;r10 = v	will be ++ each loop
	;rax = vars[v]
	;get vmax
	mov	r13,rdi
	mov	r12d,dword [rdi]		;r12 = vmax
	;cur = [nodes + 16 * next]
	xor	r10,r10
.head:	
.h1	mov	r11,rsi			;rsi = next
.h2	shl	r11d,4			;multiply by 16 (4x32-bit)
.shift:	nop
;	lea	r11,[rdi + r11]		;r11 = *cur
.s1	add	r11,r13
.s2	mov	r9d,dword [r11]
.s3	cmp	r9d,r12d	;cur->v,vmax
.s4	je	.done
.s6	cmp	r10d,dword[r11]		;v,cur->v
.s7	jl	.inc			;increment and check again
.s8	add	r11,4
.s9	movzx	rax,byte [rdx]		;load term into rax
.s10	shl	rax,4			;multiply by sizeof(node):16
.s11	add	r11,rax		;point r11 to lo|hi
.s12	mov	esi,dword [r11]		;next = lo|hi
.check:	nop
.inc:
	inc	r10
	inc	rdx
	jmp	.head

.done:
	;for now, get the retun value right. Do cleanup later.
	;r11 points to a sink node. Return r11.lo
	lea	r11,[r11+4]
	mov	rax,[r11]
	ret
