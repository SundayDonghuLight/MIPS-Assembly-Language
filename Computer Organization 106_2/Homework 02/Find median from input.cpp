#include<iostream>
using namespace std;

int main(){
    int sequence[100], i=0, temp;

    //input data
    cout << "enter numbers, EOF to find the median of this sequence" << endl;
    while(1){
        cin>>temp;
        if(cin.eof())
            break;
        sequence[i] = temp;
        i++;
    }
    int j,k;

    //insertion sort
    for(j=1;j<i;j++){
        temp = sequence[j];
        k = j-1;
        while(k >= 0 && temp < sequence[k]){
            sequence[k+1] = sequence[k];
            k--;
        }
        sequence[k+1] = temp;
    }
    cout<<"sorted sequence:";
    for(j=0;j<i;j++){
        cout<<sequence[j]<<" ";
    }

    //find median
    if(i%2!=0){
        cout<<endl<<"median = "<<sequence[i/2]<<endl;
    }
    else{
        cout<<endl<<"median = "<<(sequence[i/2-1]+sequence[i/2])/2<<endl;
    }

    return 0;
}
