#include <stdio.h>


struct node {
	int	v;
	int	lo;
	int	hi;
	int	aux;
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

char vals[6];






int seval(int cur, int end, char *vals) {
	int k = nodes[cur].v;
	//mov	ecx,[nodes+start*16B]
	char term;
	int vmax = nodes[end].v;
	//mov	r15,[nodes+end*16B]
	do {
		term = vals[k];
		//mov r14,[vals+k]
		if(k == nodes[cur].v) {
			//cmp ecx,[nodes+cur*16]
			//jne k++;
			if(!term)
				//cmp	r14,1
				//jne else:
				cur = nodes[cur].lo;
				//lea edi,[nodes+cur*16+4]
				//jmp k++
			else
				cur = nodes[cur].hi;
				//lea edi,[nodes+edi*16+8]
		}
		k++;
		//inc ecx

	} while (k < vmax);
	//cmp ecx,r15
	//jl do:
	return nodes[cur].lo;
}













int ceval(int cur, int end, char *vals) {
	int v = nodes[cur].v;
	char term;
	do{
		if(v == nodes[cur].v) {
			term = vals[v];
			cur = *((int *)(nodes + cur*4) + term);
		}
		v++;
	}	while(cur > end);
	return nodes[cur].lo;

}
void make_vars(char *buf,int perm, int terms) {
	for(int i = terms-1;i>=0;i--)
	{	buf[i] = (perm >> i) & 1;
		putchar(buf[i] + 48);
	}
}

void make_ascii(char *buf,int terms) {
	for(int i = 0;i<terms;i++)
		buf[i] += 0x30;
}

void de_ascii(char *buf,int terms) {
	for(int i = 0;i<terms;i++)
		buf[i] -= 0x30;
}

int main() {
//	printf("int size:%d\n",sizeof(int));
//	for(int i =0;i<28;i++) {
//		printf("%d: %d?%d:%d\t%d\n",i,nodes[i].v,nodes[i].lo,nodes[i].hi,nodes[i].aux);
//	}
//	printf("Addresses: %p\t%p\t%p\n",&nodes[27],&nodes[1],vals);
//	fflush(stdout);
	for(int i = 0; i < 0x40; i++) {
//		make_vars(vals,i,6);
		int r = eval(27,nodes, i);
		printf("%X:%d\n",i,r);

	}
	return 0;
}
