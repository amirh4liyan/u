#include <iostream>

using namespace std;

int main() {
	int m, n;
	cout << "Enter n, m: ";
	cin >> n >> m;

	if (m <= 0 || n <= 0)
		cout << "you should enter valid n, m\n";
	auto A = new int[3][3];
	for (int i = 0; i < n; i++)
		for (int j = 0; j < m; j++)
			cin >> A[i][j];

	int x;
	cout << "Enter x: ";
	cin >> x;
	for (int i = 0; i < n; i++)
		for (int j = 0; j < m; j++)
			if (A[i][j] == x)
				cout << i << ", " << j << "\n";
		
	return 0;
}
