#include <iostream>

using namespace std;

int main() {
	int x1;
	cin >> x1;
	int min, max;
	min = x1; max = x1;
	int i = 2;
	while(i <= 10) {
		int xi;
		cin >> xi;
		if (xi > max)
			max = xi;
		if (xi < min)
			min = xi;
		i += 1;
	}
	cout << "min: " << min << "\t max: " << max << endl;
	return 0;
}
