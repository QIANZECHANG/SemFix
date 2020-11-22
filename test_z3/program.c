#include<stdio.h>
#include<stdlib.h>
#include"klee/klee.h"
int is_upward_preferred(int inhibit, int up_sep, int down_sep){
    int bias;
    if (inhibit)
        //bias=down_sep; //fix: bias=up_sep+100
	klee_make_symbolic(&bias,sizeof(bias),"bias");
    else
        bias=up_sep;
    if (bias>down_sep)
        return 1;
    else
	return 0;
}
int main(int argc,char* argv[]){
    int a=atoi(argv[1]);
    int b=atoi(argv[2]);
    int c=atoi(argv[3]);
    return is_upward_preferred(a,b,c);
}





