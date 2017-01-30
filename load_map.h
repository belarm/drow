#include <stdio.h>
#include <stdlib.h>
#define _MAX_WIDTH 4097
char *load_map(char *filename,int *width, int *height) {
	FILE *in = fopen(filename,"r");
	char buf[_MAX_WIDTH];
	int h,w;
	char *ret;
	fgets(buf,_MAX_WIDTH,in);
	fscanf(in,"height %d\n",&h);
	fscanf(in,"width %d\n",&w);
	ret = malloc(w*h * sizeof(char) /*1*/);
	fgets(buf,_MAX_WIDTH,in);
	for(int i = 0;i<h;i++) {
		fgets(buf,_MAX_WIDTH,in);
		for(int j=0;j<w;j++) {
			ret[i * w + j] = buf[j] == '.' ? (char)1 : (char)0;
		}
	}
	fclose(in);
	*width = w;
	*height = h;
	return ret;
}
