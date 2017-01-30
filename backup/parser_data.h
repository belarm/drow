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

extern char vars[] = {0,1,1,0,0,1};


//#define node(X, Y, Z, A) {.v = (X), .lo = (int32_t)((void *)&&node_addr + (Y) * sizeof(node)), .hi = (int32_t)((void *)&&node_addr + (Z) * sizeof(node)), .aux = (A)} 
extern struct node nodes[28] = {
/*#define _node(X) (int32_t)&nodes[(X)]
[0] = {.v = 6,.lo = _node(0),.hi = _node(0),.aux=0},
[1] = {.v = 6,.lo = _node(1),.hi = _node(1),.aux=0},
[2] = {.v = 5,.lo = _node(1),.hi = _node(0),.aux=0},
[3] = {.v = 5,.lo = _node(0),.hi = _node(1),.aux=0},
[4] = {.v = 4,.lo = _node(0),.hi = _node(2),.aux=0},
[5] = {.v = 4,.lo = _node(1),.hi = _node(2),.aux=0},
[6] = {.v = 4,.lo = _node(3),.hi = _node(0),.aux=0},
[7] = {.v = 4,.lo = _node(2),.hi = _node(1),.aux=0},
[8] = {.v = 4,.lo = _node(1),.hi = _node(0),.aux=0},
[9] = {.v = 4,.lo = _node(2),.hi = _node(0),.aux=0},
[10] = {.v = 4,.lo = _node(1),.hi = _node(3),.aux=0},
[11] = {.v = 4,.lo = _node(3),.hi = _node(2),.aux=0},
[12] = {.v = 4,.lo = _node(3),.hi = _node(1),.aux=0},
[13] = {.v = 3,.lo = _node(4),.hi = _node(0),.aux=0},
[14] = {.v = 3,.lo = _node(5),.hi = _node(0),.aux=0},
[15] = {.v = 3,.lo = _node(5),.hi = _node(6),.aux=0},
[16] = {.v = 3,.lo = _node(7),.hi = _node(8),.aux=0},
[17] = {.v = 3,.lo = _node(2),.hi = _node(9),.aux=0},
[18] = {.v = 3,.lo = _node(10),.hi = _node(2),.aux=0},
[19] = {.v = 3,.lo = _node(5),.hi = _node(11),.aux=0},
[20] = {.v = 3,.lo = _node(12),.hi = _node(5),.aux=0},
[21] = {.v = 2,.lo = _node(13),.hi = _node(14),.aux=0},
[22] = {.v = 2,.lo = _node(15),.hi = _node(16),.aux=0},
[23] = {.v = 2,.lo = _node(17),.hi = _node(18),.aux=0},
[24] = {.v = 2,.lo = _node(19),.hi = _node(20),.aux=0},
[25] = {.v = 1,.lo = _node(21),.hi = _node(22),.aux=0},
[26] = {.v = 1,.lo = _node(23),.hi = _node(24),.aux=0},
[27] = {.v = 0,.lo = _node(25),.hi = _node(26),.aux=0}

*/








/*node(6,0,0,0),
node(6,1,1,0),
node(5,1,0,0),
node(5,0,1,0),
node(4,0,2,0),
node(4,1,2,0),
node(4,3,0,0),
node(4,2,1,0),
node(4,1,0,0),
node(4,2,0,0),
node(4,1,3,0),
node(4,3,2,0),
node(4,3,1,0),
node(3,4,0,0),
node(3,5,0,0),
node(3,5,6,0),
node(3,7,8,0),
node(3,2,9,0),
node(3,10,2,0),
node(3,5,11,0),
node(3,12,5,0),
node(2,13,14,0),
node(2,15,16,0),
node(2,17,18,0),
node(2,19,20,0),
node(1,21,22,0),
node(1,23,24,0),
node(0,25,26,0)
*/

/*  0 */	{.v = 6, .lo = 0, .hi = 0, .aux = 0},
/*  1 */	{.v = 6, .lo = 1, .hi = 1, .aux = 0},
/*  2 */	{.v = 5, .lo = 1, .hi = 0, .aux = 0},
/*  3 */	{.v = 5, .lo = 0, .hi = 1, .aux = 0},
/*  4 */	{.v = 4, .lo = 0, .hi = 2, .aux = 0},
/*  5 */	{.v = 4, .lo = 1, .hi = 2, .aux = 0},
/*  6 */	{.v = 4, .lo = 3, .hi = 0, .aux = 0},
/*  7 */	{.v = 4, .lo = 2, .hi = 1, .aux = 0},
/*  8 */	{.v = 4, .lo = 1, .hi = 0, .aux = 0},
/*  9 */	{.v = 4, .lo = 2, .hi = 0, .aux = 0},
/* 10 */	{.v = 4, .lo = 1, .hi = 3, .aux = 0},
/* 11 */	{.v = 4, .lo = 3, .hi = 2, .aux = 0},
/* 12 */	{.v = 4, .lo = 3, .hi = 1, .aux = 0},
/* 13 */	{.v = 3, .lo = 4, .hi = 0, .aux = 0},
/* 14 */	{.v = 3, .lo = 5, .hi = 0, .aux = 0},
/* 15 */	{.v = 3, .lo = 5, .hi = 6, .aux = 0},
/* 16 */	{.v = 3, .lo = 7, .hi = 8, .aux = 0},
/* 17 */	{.v = 3, .lo = 2, .hi = 9, .aux = 0},
/* 18 */	{.v = 3, .lo = 10, .hi = 2, .aux = 0},
/* 19 */	{.v = 3, .lo = 5, .hi = 11, .aux = 0},
/* 20 */	{.v = 3, .lo = 12, .hi = 5, .aux = 0},
/* 21 */	{.v = 2, .lo = 13, .hi = 14, .aux = 0},
/* 22 */	{.v = 2, .lo = 15, .hi = 16, .aux = 0},
/* 23 */	{.v = 2, .lo = 17, .hi = 18, .aux = 0},
/* 24 */	{.v = 2, .lo = 19, .hi = 20, .aux = 0},
/* 25 */	{.v = 1, .lo = 21, .hi = 22, .aux = 0},
/* 26 */	{.v = 1, .lo = 23, .hi = 24, .aux = 0},
/* 27 */	{.v = 0, .lo = 25, .hi = 26, .aux = 0}
};
