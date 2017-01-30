#define _GNU_SOURCE
#include <unistd.h>
#include <sched.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>

int variable, fd;

int do_something() {
   variable = 42;
   close(fd);
   _exit(0);
}

int main(int argc, char *argv[]) {
   void **child_stack;
   char tempch;

   variable = 9;
   fd = open("test.file", O_RDONLY);
   child_stack = (void **) malloc(16384);
   printf("The variable was %d\n", variable);
   
   clone(do_something, child_stack, CLONE_VM|CLONE_FILES, NULL);
   sleep(1);

   printf("The variable is now %d\n", variable);
   if (read(fd, &tempch, 1) < 1) {
      perror("File Read Error");
      exit(1);
   }
   printf("We could read from the file\n");
   return 0;
}
    
