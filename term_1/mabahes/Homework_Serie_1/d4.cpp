#include <iostream>

using namespace std;

int main() {
	int f;
	int x;
	cin >> x;
	if (x > 2)
		f = (x*x*x) - 2*(x*x) + 5*(x) - 3;
	else if (x < 2)
		f = 4*(x*x*x) - (x)*(x+1) - 1;
	else 
		f = -2;
	cout << "f: " << f << endl;
	return 0;
}
