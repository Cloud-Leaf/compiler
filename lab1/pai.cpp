#include <iostream> 
#include <iomanip>
using namespace std;
int main()
{
	int n,a=1;
	double pai=0;
	cin >> n;
	n *= 2;
	for (double i = 1; i <= n; i += 2)
	{
		if (a % 2 == 1)pai += (1/i);
		else pai -= (1/i);
		a++;
	}
	cout << 4 * pai;
	return 0;
}