all: bddone eval checker

#extdata: extdata.asm hello_64_data.o
#	nasm -f elf64 -l extdata.lst extdata.asm
#	ld -o extdata -s extdata.o hello_64_data.o

#syscall: syscall.asm
#	nasm -f elf64 -l syscall.lst sycall.asm
#	ld -o syscall -s syscall.o

#readfile: readfile.asm
#	nasm -f elf64 -l readfile.lst readfile.asm
#	gcc -m64 -o readfile readfile.o

#register: register.asm
#	nasm -f elf64 -l register.lst register.asm -gstabs
#	#ld -o register -s register.o
#	gcc -m64 -o register register.o -g

#parser: parser.c bddone.asm parser_data.h
#	nasm -f elf64 -l bddone.lst bddone.asm -gstabs
#	gcc -m64 -O0 -g -o parser parser.c bddone.o

bddone: bddone.asm
	nasm -f elf64 bddone.asm -l bddone.lst
	ld -m elf_x86_64 -o bddone bddone.o
#	gcc -m64 -o bddone bddone.o -g
eval.o: eval.asm	
	nasm -f elf64 eval.asm -l eval.lst
eval: eval.asm
	nasm -f elf64 eval.asm -l eval.lst

checker: checker.c load_bdd.h load_map.h
	gcc -m64 checker.c eval.o -o checker -fno-omit-frame-pointer
