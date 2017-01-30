#include <stdio.h>
#include <stdlib.h>
struct node {
   int   v;
   int   lo;
   int   hi;
   int   aux;
};
typedef struct node node;

extern int eval(int start,node *nodes,int vals);

node nodes[28] = {
{.v = 6,.lo=0,.hi=0,.aux=0},
{.v = 6,.lo=1,.hi=1,.aux=0},
{.v = 5,.lo=1,.hi=0,.aux=0},
{.v = 5,.lo=0,.hi=1,.aux=0},
{.v = 4,.lo=0,.hi=2,.aux=0},
{.v = 4,.lo=1,.hi=2,.aux=0},
{.v = 4,.lo=3,.hi=0,.aux=0},
{.v = 4,.lo=2,.hi=1,.aux=0},
{.v = 4,.lo=1,.hi=0,.aux=0},
{.v = 4,.lo=2,.hi=0,.aux=0},
{.v = 4,.lo=1,.hi=3,.aux=0},
{.v = 4,.lo=3,.hi=2,.aux=0},
{.v = 4,.lo=3,.hi=1,.aux=0},
{.v = 3,.lo=4,.hi=0,.aux=0},
{.v = 3,.lo=5,.hi=0,.aux=0},
{.v = 3,.lo=5,.hi=6,.aux=0},
{.v = 3,.lo=7,.hi=8,.aux=0},
{.v = 3,.lo=2,.hi=9,.aux=0},
{.v = 3,.lo=10,.hi=2,.aux=0},
{.v = 3,.lo=5,.hi=11,.aux=0},
{.v = 3,.lo=12,.hi=5,.aux=0},
{.v = 2,.lo=13,.hi=14,.aux=0},
{.v = 2,.lo=15,.hi=16,.aux=0},
{.v = 2,.lo=17,.hi=18,.aux=0},
{.v = 2,.lo=19,.hi=20,.aux=0},
{.v = 1,.lo=21,.hi=22,.aux=0},
{.v = 1,.lo=23,.hi=24,.aux=0},
{.v = 0,.lo=25,.hi=26,.aux=0}
};




node *load(char *filename, int *root) {
	FILE *in = fopen(filename,"r");
	int max;
	int v,lo,hi,i;
	fscanf(in,"%d\t%d\t%d\t%d\n",&i,&v,&lo,&hi);
	*root = i;
	node *r = malloc(i * sizeof(node));
	fseek(in,0,SEEK_SET);
	do {
		fscanf(in,"%d\t%d\t%d\t%d\n",&i,&v,&lo,&hi);
		r[i].v = v;
		r[i].lo = lo;
		r[i].hi = hi;
		r[i].aux = 0;
	} while(!feof(in));
	fclose(in);
	return r;
}

void printBDD(node *bdd, int max, char *outname) {
	FILE *out = fopen(outname,"w");
	for(int i = 0;i<=max;i++) {
		fprintf(out,"%d\t%d\t%d\t%d\n",i,bdd[i].v,bdd[i].lo,bdd[i].hi);
	}
}




