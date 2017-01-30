        section .data		; Data section, initialized variables
raw:			dd	0xFFFFa500
msg:		db	"Hello World",0
fmt:			db	"%x", 10, 0          ; The printf format, "\n",'0'