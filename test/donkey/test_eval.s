	.file	"test_eval.c"
	.intel_syntax noprefix
# GNU C11 (Debian 5.4.1-1) version 5.4.1 20160803 (x86_64-linux-gnu)
#	compiled by GNU C version 5.4.1 20160803, GMP version 6.1.1, MPFR version 3.1.4-p2, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu test_eval.c -m64
# -masm=intel -mtune=generic -march=x86-64 -Og -fverbose-asm
# options enabled:  -faggressive-loop-optimizations
# -fasynchronous-unwind-tables -fauto-inc-dec -fchkp-check-incomplete-type
# -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
# -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
# -fchkp-use-static-bounds -fchkp-use-static-const-bounds
# -fchkp-use-wrappers -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fdefer-pop -fdelete-null-pointer-checks
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fforward-propagate -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fident -finline -finline-atomics
# -fipa-profile -fipa-pure-const -fipa-reference -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots -fivopts
# -fkeep-static-consts -fleading-underscore -flifetime-dse
# -flto-odr-type-merging -fmath-errno -fmerge-constants
# -fmerge-debug-strings -fomit-frame-pointer -fpeephole
# -fprefetch-loop-arrays -freg-struct-return
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
# -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fstdarg-opt -fstrict-volatile-bitfields
# -fsync-libcalls -ftoplevel-reorder -ftrapping-math -ftree-ccp -ftree-ch
# -ftree-coalesce-vars -ftree-copy-prop -ftree-copyrename -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-ter
# -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops
# -mavx256-split-unaligned-load -mavx256-split-unaligned-store
# -mfancy-math-387 -mfp-ret-in-387 -mfxsr -mglibc -mieee-fp
# -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone -msse -msse2
# -mtls-direct-seg-refs -mvzeroupper

	.text
	.globl	seval
	.type	seval, @function
seval:
.LFB11:
	.cfi_startproc
	movsx	rax, edi	# cur, cur
	sal	rax, 4	# tmp100,
	mov	eax, DWORD PTR nodes[rax]	# k, nodes[cur_5(D)].v
	movsx	rsi, esi	# end, end
	sal	rsi, 4	# tmp104,
	mov	r8d, DWORD PTR nodes[rsi]	# vmax, nodes[end_7(D)].v
.L4:
	movsx	rcx, eax	# D.2447, k
	movzx	esi, BYTE PTR [rdx+rcx]	# term, *_11
	movsx	rcx, edi	# cur, cur
	sal	rcx, 4	# tmp109,
	cmp	eax, DWORD PTR nodes[rcx]	# k, nodes[cur_1].v
	jne	.L2	#,
	test	sil, sil	# term
	jne	.L3	#,
	mov	edi, DWORD PTR nodes[rcx+4]	# cur, nodes[cur_1].lo
	jmp	.L2	#
.L3:
	movsx	rdi, edi	# cur, cur
	sal	rdi, 4	# tmp118,
	mov	edi, DWORD PTR nodes[rdi+8]	# cur, nodes[cur_1].hi
.L2:
	add	eax, 1	# k,
	cmp	r8d, eax	# vmax, k
	jg	.L4	#,
	movsx	rdi, edi	# cur, cur
	sal	rdi, 4	# tmp124,
	mov	eax, DWORD PTR nodes[rdi+4]	# nodes[cur_2].lo, nodes[cur_2].lo
	ret
	.cfi_endproc
.LFE11:
	.size	seval, .-seval
	.globl	ceval
	.type	ceval, @function
ceval:
.LFB12:
	.cfi_startproc
	movsx	rax, edi	# cur, cur
	sal	rax, 4	# tmp105,
	mov	ecx, DWORD PTR nodes[rax]	# v, nodes[cur_5(D)].v
.L7:
	movsx	rax, edi	# cur, cur
	sal	rax, 4	# tmp109,
	cmp	ecx, DWORD PTR nodes[rax]	# v, nodes[cur_1].v
	jne	.L6	#,
	movsx	rax, ecx	# D.2451, v
	movsx	rdi, edi	# D.2453, cur
	sal	rdi, 4	# D.2453,
	movsx	rax, BYTE PTR [rdx+rax]	# D.2451, *_10
	add	rdi, rax	# D.2451, D.2451
	mov	edi, DWORD PTR nodes[0+rdi*4]	# cur, *_17
.L6:
	add	ecx, 1	# v,
	cmp	edi, esi	# cur, end
	jg	.L7	#,
	movsx	rdi, edi	# cur, cur
	sal	rdi, 4	# tmp120,
	mov	eax, DWORD PTR nodes[rdi+4]	# nodes[cur_2].lo, nodes[cur_2].lo
	ret
	.cfi_endproc
.LFE12:
	.size	ceval, .-ceval
	.globl	make_vars
	.type	make_vars, @function
make_vars:
.LFB13:
	.cfi_startproc
	push	r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	r12, rdi	# buf, buf
	mov	ebp, esi	# perm, perm
	lea	ebx, [rdx-1]	# i,
	jmp	.L9	#
.L10:
	movsx	rax, ebx	# D.2455, i
	mov	edi, ebp	# D.2457, perm
	mov	ecx, ebx	# tmp102, i
	sar	edi, cl	# D.2457, tmp102
	and	edi, 1	# D.2458,
	mov	BYTE PTR [r12+rax], dil	# *_8, D.2458
	movsx	edi, dil	# D.2457, D.2458
	add	edi, 48	# D.2457,
	mov	rsi, QWORD PTR stdout[rip]	#, stdout
	call	_IO_putc	#
	sub	ebx, 1	# i,
.L9:
	test	ebx, ebx	# i
	jns	.L10	#,
	pop	rbx	#
	.cfi_def_cfa_offset 24
	pop	rbp	#
	.cfi_def_cfa_offset 16
	pop	r12	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	make_vars, .-make_vars
	.globl	make_ascii
	.type	make_ascii, @function
make_ascii:
.LFB14:
	.cfi_startproc
	mov	eax, 0	# i,
	jmp	.L13	#
.L14:
	movsx	rdx, eax	# D.2460, i
	add	BYTE PTR [rdi+rdx], 48	# *_7,
	add	eax, 1	# i,
.L13:
	cmp	eax, esi	# i, terms
	jl	.L14	#,
	rep ret
	.cfi_endproc
.LFE14:
	.size	make_ascii, .-make_ascii
	.globl	de_ascii
	.type	de_ascii, @function
de_ascii:
.LFB15:
	.cfi_startproc
	mov	eax, 0	# i,
	jmp	.L16	#
.L17:
	movsx	rdx, eax	# D.2464, i
	sub	BYTE PTR [rdi+rdx], 48	# *_7,
	add	eax, 1	# i,
.L16:
	cmp	eax, esi	# i, terms
	jl	.L17	#,
	rep ret
	.cfi_endproc
.LFE15:
	.size	de_ascii, .-de_ascii
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	":%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB16:
	.cfi_startproc
	push	rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	ebx, 0	# i,
	jmp	.L19	#
.L20:
	mov	edx, 6	#,
	mov	esi, ebx	#, i
	mov	edi, OFFSET FLAT:vals	#,
	call	make_vars	#
	mov	edx, OFFSET FLAT:vals	#,
	mov	esi, 1	#,
	mov	edi, 27	#,
	call	seval	#
	mov	esi, eax	#, r
	mov	edi, OFFSET FLAT:.LC0	#,
	mov	eax, 0	#,
	call	printf	#
	add	ebx, 1	# i,
.L19:
	cmp	ebx, 63	# i,
	jle	.L20	#,
	mov	eax, 0	#,
	pop	rbx	#
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE16:
	.size	main, .-main
	.comm	vals,6,1
	.globl	nodes
	.data
	.align 32
	.type	nodes, @object
	.size	nodes, 448
nodes:
# v:
	.long	6
# lo:
	.long	0
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	6
# lo:
	.long	1
# hi:
	.long	1
# aux:
	.long	0
# v:
	.long	5
# lo:
	.long	1
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	5
# lo:
	.long	0
# hi:
	.long	1
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	0
# hi:
	.long	2
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	1
# hi:
	.long	2
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	3
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	2
# hi:
	.long	1
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	1
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	2
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	1
# hi:
	.long	3
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	3
# hi:
	.long	2
# aux:
	.long	0
# v:
	.long	4
# lo:
	.long	3
# hi:
	.long	1
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	4
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	5
# hi:
	.long	0
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	5
# hi:
	.long	6
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	7
# hi:
	.long	8
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	2
# hi:
	.long	9
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	10
# hi:
	.long	2
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	5
# hi:
	.long	11
# aux:
	.long	0
# v:
	.long	3
# lo:
	.long	12
# hi:
	.long	5
# aux:
	.long	0
# v:
	.long	2
# lo:
	.long	13
# hi:
	.long	14
# aux:
	.long	0
# v:
	.long	2
# lo:
	.long	15
# hi:
	.long	16
# aux:
	.long	0
# v:
	.long	2
# lo:
	.long	17
# hi:
	.long	18
# aux:
	.long	0
# v:
	.long	2
# lo:
	.long	19
# hi:
	.long	20
# aux:
	.long	0
# v:
	.long	1
# lo:
	.long	21
# hi:
	.long	22
# aux:
	.long	0
# v:
	.long	1
# lo:
	.long	23
# hi:
	.long	24
# aux:
	.long	0
# v:
	.long	0
# lo:
	.long	25
# hi:
	.long	26
# aux:
	.long	0
	.ident	"GCC: (Debian 5.4.1-1) 5.4.1 20160803"
	.section	.note.GNU-stack,"",@progbits
