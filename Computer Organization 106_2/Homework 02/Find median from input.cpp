#include<iostream>
#include<stdio.h>
using namespace std;

int main(){
    int a[100];
    char c;
    int i=0;
    int tem;
    while(1){
        scanf("%d%c",&a[i],&c);
        if(c==EOF||c=='e')
            break;
        i++;
    }
    for(int j=0;j<i;j++){
        int Min=a[j];
        int M_position=j;
        for(int k=j+1;k<=i;k++){
            if(a[k]<Min){
                Min=a[k];
                M_position=k;
            }
        }
        tem = a[j];
        a[j] = Min;
        a[M_position] = tem;
    }

    for(int j=0;j<=i;j++){
        cout<<a[j]<<" ";
    }
    if(i%2==0){
        int mid = i/2;
        cout<<endl<<a[mid];
    }
    else{
        int midL = i/2;
        int midR = midL+1;
        float median = (float)(a[midL]+a[midR])/2;
        cout<<endl<<median;
    }
    return 0;
}
