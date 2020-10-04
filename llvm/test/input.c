#include<stdio.h>
#include<stdlib.h>
int main(int argc,char* argv[]){
    int a=atoi(argv[1]);
    int b=atoi(argv[2]);
    if(a+b>10){
        printf("1\n");
    }else if(a+b<5){
        printf("-1\n");
    }else{
        printf("0\n");
    }
    return 0;
}
