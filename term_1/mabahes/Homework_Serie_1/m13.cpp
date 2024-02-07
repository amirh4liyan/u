#include <iostream>

using namespace std;

int main() {
	int n;
	cout << "Enter N: ";
	cin >> n;


	if (n <= 0)
		cout << "you should enter positive number!\n";
	else if (n <= 2)
		cout << "1\n";
	else {
		int* f = new int[n];
		f[0] = 1;
		f[1] = 1;
		int i = 2;
		while (i < n) {
			f[i] = f[i-1] + f[i-2];
			i++;
		}
		for (int i = 0; i < n; i++)
			cout << f[i] << "\n";
	}
	return 0;
}
