#include <iostream>
#include <cmath>

using namespace std;

bool isPrime(int x);

int main() {
	for (int i = 2; i < 1000; i++)
		if(isPrime(i))
			cout << i << endl;
	return 0;
}

bool isPrime(int x) {
	int end = (int) pow(x, 0.5);
	for (int i = 2; i <= end; i++) 
		if (x % i == 0) 
			return false;
	return true;
}
