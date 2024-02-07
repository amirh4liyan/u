#include <iostream>

using namespace std;

int main() {
	int a, b;
	cout << "Enter a, b: ";
	cin >> a >> b;

	int u = a + b;
	if (u < 0)
		u *= (-1);
	if (a < 0)
		a *= (-1);
	if (b < 0)
		b *= (-1);
	int sum = a + b - (2 * u);
	cout << sum << "\n";
	return 0;
}
