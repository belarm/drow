#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stddef.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define _nsize	(sizeof(struct node))
struct node {
	int32_t v;
	int32_t aux;
	int32_t lo;
	int32_t hi;
};

typedef struct node node;

char vars[] = {0,0,1,0,1,0};


//#define node(X, Y, Z, A) {.v = (X), .lo = (int32_t)((void *)&&node_addr + (Y) * sizeof(node)), .hi = (int32_t)((void *)&&node_addr + (Z) * sizeof(node)), .aux = (A)} 
extern struct node nodes[];
