#include "load_bdd.h"
#include "load_map.h"
#include <time.h>


int main(int argc, char *argv[]) {
	int width,height;
	char *truth = load_map("maps/problem_set3_map22.map",&width,&height);
	for(int j = 0;j < height;j++) {
		for(int k = 0; k < width; k++) {
			putchar(truth[k+j*width] + 0x30);
		}
		putchar('\n');
	}



	int max;
	node *ns = load(argv[1],&max);
	printBDD(ns,max,"output.abdd");
	



	int value;
	int terms = ns[0].v;
	printf("BDD has %d variables\n",terms);
	int max_v = (1 << ns[0].v) - 1;
	printf("Evaluating %d arguments\n",max_v);
	clock_t start = clock();
	for(int i = i; i < max_v; i++) {
		value = eval(max,ns,i);
	}
	clock_t end = clock();
	double secs = (double)(end-start)/CLOCKS_PER_SEC;
	printf("Rate: %f evals/s\n",max_v/secs);
/*	for(int i = 0; i < 0x40; i++) {
		int r = eval(27,nodes, i);
		printf("%X:%d\n",i,r);

	}*/
	return 0;
}
