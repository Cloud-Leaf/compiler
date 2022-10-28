#include<stdio.h>
float pai(int n){
    int a;
    float pai,rtn;

    a=1;
    pai=0;
    rtn=0;

	for (float i = 1; i <= n; i += 2)
	{
		if (a % 2 == 1)pai += (1/i);
		else pai -= (1/i);
		a++;
	}

    rtn=4*pai;
	return rtn;
}
int main()
{
    int a,b,i,t,n;
    float x;
    a = 0;
    b = 1;
    i = 1;
    x=pai(2000);
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
    printf("%f ",x);
    return 0;
}