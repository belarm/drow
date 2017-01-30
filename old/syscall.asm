
; hello_64.asm    print a string using printf
; Assemble:	  nasm -f elf64 -l hello_64.lst  hello_64.asm
; Link:		  gcc -m64 -o hello_64  hello_64.o
; Run:		  ./hello_64 > hello_64.out
; Output:	  cat hello_64.out

; Equivalent C code
; // hello.c
; #include <stdio.h>
; int main()
; {
;   char msg[] = "Hello world\n";
;   printf("%s\n",msg);
;   return 0;
; }
;
	section .data		; Data section, initialized variables
msg:	db 'Hello world',10,0

        section .text           ; Code section.

        global _start
_start:				; the program label for the entry point
	mov rax,1
	mov rdi,1
	mov rsi,msg
	mov rdx,12
	syscall
;	mov $1, %rax
;	mov $1, %rdi
;	mov $msg, %rsi
;	mov $12, %rdx
;	syscall

	mov rax,60
	mov rdi,0
	syscall







;	push    rbp		; set up stack frame, must be alligned
	
;	mov	rdi,fmt
;	mov	rsi,msg
;	mov	rax,0		; or can be  xor  rax,rax
 ;       call    printf		; Call C function

;	pop	rbp		; restore stack

;	mov	rax,0		; normal, no error, return value
;	ret			; return
