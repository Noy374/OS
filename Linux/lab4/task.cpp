#include<iostream>
#include<math.h>
int mul(int m,int n) {
    int k = 0;
    while (true) {
    int m1=pow(m,k) ;
    std::cout<<"m^"<<k<<"="<<m1<<std::endl;
    while(m1>0){
    if (m1%10==n) return k;
    m1/=10;
    }
       k++;
    }
    
}
 
int main(void)
{
    int n, m;
    std::cin >> n >> m;
    std::cout<<mul(m,n)<<std::endl;
            return 0;
    
}
