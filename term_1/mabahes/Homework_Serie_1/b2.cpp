#include <iostream>

using namespace std;

int main() {
	int N;
	cin >> N;
	int i = 1;
	while(i <= N) {
		int x;
		cin >> x;
		if (x % 7 == 0) {
			cout << "dividable by 7: " << x << endl;
			i += 1;
		}
	}
	return 0;
}
