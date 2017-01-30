
; extdata.asm    load an external data section and write() to stdout
; Assemble:	  nasm -f elf64 -l extdata.lst extdata.asm
; Link:		  ld -o extdata -s extdata.o
	section .data
extern _end


	section .text           ; Code section.

	global _start
_start:				; the program label for the entry point
;	mov rax,1
;	mov rdi,1
;	mov rsi,_edata
;	mov rdx,400
;	syscall

	mov rax,60
	mov rdi,_end		;return value
	syscall







;	push    rbp		; set up stack frame, must be alligned
	
;	mov	rdi,fmt
;	mov	rsi,msg
;	mov	rax,0		; or can be  xor  rax,rax
 ;       call    printf		; Call C function

;	pop	rbp		; restore stack

;	mov	rax,0		; normal, no error, return value
;	ret			; return
