#include <iostream>

using namespace std;

int main() {
	char* A = new char[30];
	for (int i = 0; i < 30; i++)
		cin >> A[i];

	int ca = 0, cA = 0; 
	for (int i = 0; i < 30; i++)
		if (A[i] == 'A')
			cA++;
		else if (A[i] == 'a')
			ca++;
	cout << "A: " << cA << "\n";
	cout << "a: " << ca << "\n";
	return 0;
}
