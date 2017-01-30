#include "parser_data.h"


int main () {
//	struct node 			*cur = &nodes[27]; //root
//	struct node				*sinkT = &nodes[1];
	register int32_t 		k = nodes[27].v;		//root.v
	register int32_t 		v_max = nodes[0].v;	//F.v
	register int32_t		offset = (int32_t)&nodes[27];
	register int32_t		x;
	do {
		if(k == ((node *)offset)->v ) {
			x = vars[k];
			x *= 4;
			offset += 4;
			offset += x;
			offset = *(int32_t *)offset;
		}
		k++;
	}while(k < v_max);
	return (offset - (int32_t)nodes) / sizeof(node);
}
