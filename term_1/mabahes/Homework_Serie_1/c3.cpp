#include <iostream>

using namespace std;

int main() {
	int n = 5;
	auto A = new int[5][5];
	
	int i = 0;
	while (i < n) {
		int j = 0;
		while(j < n) {
			cin >> A[i][j];
			j++;
		}
		i++;
	}
	
	for (int i = 1; i < n; i++) {
		for (int j = 0; j < n; j++) {
			if (i > j) {
				A[i][j] = 0;
			}
		}
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			cout << A[i][j] << "\t";
		}
		cout << endl;
	}
	return 0;
}
