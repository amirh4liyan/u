// weighted_disorder.cpp
// First Problem of First DS Project
#include <bits/stdc++.h>

using namespace std;

vector<int> per;

int main()
{
	int n;
	cin >> n; // O(1)

	int x;
	for (int i = 0; i < n; i++) // O(n)
	{
		cin >> x; // O(1)
		per.push_back(x); // O(1)
	}

	int ans = 0;
	for (int i = 0; i < n; i++) // O(n^2)
	{
		for (int j = i+1; j < n; j++)
		{
			if (per[i] > per[j]) // O(1)
			{
				ans += j - i; // O(1)
			}
		}
	}
	cout << ans; // O(1)
	return 0;
}
