#include <iostream>

using namespace std;

int main() {
	int n;
	cout << "Enter number of students: ";
	cin >> n;

	int* m = new int[2];
	cin >> m[0] >> m[1];
	if (m[0] < m[1]) {
		int temp = m[0];
		m[0] = m[1];
		m[1] = temp;
	}
		
	int i = 2;
	while (i < n) {
		int x;
		cout << "Enter " << i << "th number: ";
		cin >> x;
		
		if (x > m[0]) {
			m[1] = m[0];
			m[0] = x;
		} else if (x > m[1]) {
			m[1] = x;
		}
		i++;
	}
	cout << "1'st student: " << m[0] << endl;
	cout << "2'st student: " << m[1]  << endl;

	return 0;
}
