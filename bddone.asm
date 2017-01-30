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
	section .text
	global main
main:	mov	r8d,[root]
	mov	r9d,[nodes]
	xor	r10,r10
	mov	r10d,root
	mov	r11d,vars
.head:	cmp	r8d,[r10d]
	jne	.inc
;	xor	rcx,rcx
	movzx	rcx, byte [r11]
	shl	rcx,2
	add	r10d,4		;point r10->node.lo
	add	r10,rcx		;offset by x*4
	mov	ecx, dword [r10]
	mov	r10,rcx	;resolve pointer
.inc	inc	r8
	inc	r11
	cmp	r8,r9
	jl	.head
	add	r10,4		;point to res.lo
	mov	edi,[r10]	;move its value (0 or 16) into ax
	sub	edi,nodes
	shr	rdi,4		;ax /= 16
	mov	rax,60
	syscall

