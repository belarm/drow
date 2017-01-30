	section .text
	global eval
	;current node = [rsi + rdi * 16]
eval:
	mov	r13,rdx	;we'll be incrementing this *vars
	shl	rdi,4	;*16bytes
	lea	r10,[rsi+rdi*1]
	mov	ecx,dword [r10]	;k=root.v
	mov	r15d,dword [rsi]	;vmax = false.v
;	mov	rcx,ecx
	lea	r10,[rsi+rdi*1]	;r10 = *cur
.head:
	cmp	ecx,[r10]
	jne	.inc
	movzx	r14,byte [r13]	;r14/term = (char)vars[k]
	lea	rax,[r10 + r14 * 4 + 4]		;point *cur to cur.lo|hi
	mov	edi,dword [rax]	;fetch value of next node
	shl	rdi,4		;*16
	lea	r10,[rsi+rdi]	;*cur -> *next
.inc:	
	inc	ecx		;k++
	inc	r13		;vars++
	cmp	ecx,r15d
	jl	.head
	lea	r15,[r10+4]	;point to node->lo
	mov	rax,[r15]
	ret
	;done?
