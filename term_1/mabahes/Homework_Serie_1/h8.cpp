#include <iostream>

using namespace std;

int main() {
	int* A = new int[20];
	for (int i = 0; i < 20; i++)
		cin >> A[i];
	
	int c = 0;
	for (int i = 0; i < 20; i++)
		if (A[i] % 10 == 3)
			c++;
	cout << c << "\n"; 
	return 0;
}
