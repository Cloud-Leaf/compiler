#include<stdio.h>
int main()
{
    int a,b,i,t,n;
    a = 0;
    b = 1;
    i = 1;
    scanf("%d",&n);//input n
    printf("%d ",a);
    printf("%d ",b);
    while (i < n)//loop
    {
        t = b;
        b = a + b;
        printf("%d ",b);
        a = t;
        i = i + 1;
    }
    return 0;
}