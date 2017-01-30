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
	;r12 = vmax
	;r11 = *cur
	;r10 = v	will be ++ each loop
	;rax = vars[v]
	;get vmax
	movzx	r12,dword [rdi]		;r12 = vmax
	;cur = [nodes + 16 * next]
	xor	r10,r10
.head:	
	movzx	r11,rsi			;rsi = next
	shl	r11,4			;multiply by 16 (4x32-bit)
	lea	r11,[rdi + r11]		;r11 = *cur
	cmp	dword [r11],r12d	;cur->v,vmax
	je	.done
	cmp	r10d,dword[r11]		;v,cur->v
	jl	.inc			;increment and check again
	movzx	rax,byte [rdx]		;load term into rax
	shl	rax,4			;multiply by sizeof(node):16
	lea	r11,[r11+rax+4]		;point r11 to lo|hi
	mov	rsi,[r11]		;next = lo|hi
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
	mov	r8,rsi
	mov	rcx,rdi
	mov	rdx,rax
	mov	rax,0
	mov	rdi,fmt
	call	printf
	ret

.mkptr:
	mov	r11,rsi
	shl	r11,4
	lea	rsi,[rdi + r11]
	jmp	<somewhere>
e1:	



evalold:
l1:	mov	r12,rdi		;*cur; init to root
l2:	;mov	r13,rsi		;*false
l3:	mov	r14,rdx 	;*vars
l4:	mov	r8d,[r12d]	;v = *cur->v
l5:	cmp	r8d,[r12d]	;v == *cur-> ?
l6:	jne	l11
l7:	mov	r15d,[edx]	;get x[v]
l8:	shl	r15,4			;multiply by sizeof(node)
l9:	lea	r12,[rsi+r15+4]	;offset by (false + {1|0} * 4bytes + 4bytes (offset of .lo))
;l10:	mov	r12,[r12d]	;point *cur to cur->lo or cur->hi
l11:	inc	r8		;v++
l12:	inc	rdx		;vars++
l13:	cmp	r8,[rsi]	;cur == false? (actually, v == vmax)
l14:	jl	l5
l15:			;set rax to cur->lo, restore args, and return
l16:	lea	r12,[r12 + 1*4] 	;point cur to lo
l17:	mov	rax,[r12]	;store value of lo in rax for return
l18:	mov	rdi,r12
l19:	mov	rdx,r13
l20:	ret


