#include <stdio.h>
#include <unistd.h>
#include <stddef.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


struct node {
	int32_t v;
	int32_t lo;
	int32_t hi;
	int32_t aux;
};

typedef struct node node;
extern node nodes[28];

int main() {
	for(int i = 0;i<=28;i++) {
		printf("dd %d,%d,%d,%d\n",nodes[i].v,nodes[i].lo,nodes[i].hi,nodes[i].aux);
		node *lo = (node *)nodes[i].lo;
		node *hi = (node *)nodes[i].hi;
		printf("\tlo: %d,%d,%d,%d\n",lo->v,lo->lo-(int)(void *)nodes,lo->hi-(int)(void *)nodes,lo->aux);
		printf("\thi: %d,%d,%d,%d\n",hi->v,hi->hi-(int)(void *)nodes,hi->hi-(int)(void *)nodes,hi->aux);
	}
}
