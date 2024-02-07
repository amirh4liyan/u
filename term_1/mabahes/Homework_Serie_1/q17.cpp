#include <iostream>

using namespace std;

int main() {
	int a;
	cout << "Enter a Number: ";
	cin >> a;

	int z = 0;
	int r = 0;
	while (a > 0) {
		r = a % 10;
		z = (z*10) + r;
		a = (a-r) / 10;
	}
	cout << "reversed: " << z << endl;
	return 0;
}
