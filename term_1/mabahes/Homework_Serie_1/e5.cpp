#include <iostream>
#include <cmath>

using namespace std;

int main() {
	bool isNegative = false;
	int a, b, c;
	cin >> a >> b >> c;
	if (a == 0) {
		cout << "this is not from power of 2 :(";
	} else {
		float delta = (float) ((b*b) - 4*a*c);
		if (delta < 0) {
			isNegative = true;
			delta *= -1;
			float sqrtOfDelta = pow(delta, 0.5);
			float r1 = (-b) / (2*a);
			float i1 = (+sqrtOfDelta) / (2*a);
			float i2 = (-sqrtOfDelta) / (2*a);
			cout << "x1: " << r1 << " + " << i1 << "i" << endl;
			cout << "x2: " << r1 << " + " << i2 << "i" << endl;
		} else {
			float sqrtOfDelta = pow(delta, 0.5);
			float x1 = (-b + sqrtOfDelta) / (2*a);
			float x2  = (-b - sqrtOfDelta) / (2*a);
			cout << "x1: " << x1 << endl;
			if (x1 != x2)
				cout << "x2: " << x2 << endl;
		}
	}
	
	return 0;
}
