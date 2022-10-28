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
    float x;
    x=0;
    x=pai(2000);
    printf("%f ",x);
    return 0;
}