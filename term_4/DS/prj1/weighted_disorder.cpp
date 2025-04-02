// weighted_disorder.cpp
// First Problem of First DS Project
#include <bits/stdc++.h>

using namespace std;

vector<int> per;

int main()
{
	int n;
	cin >> n;

	int x;
	for (int i = 0; i < n; i++)
	{
		cin >> x;
		per.push_back(x);
	}

	int ans = 0;
	for (int i = 0; i < n; i++)
	{
		for (int j = i+1; j < n; j++)
		{
			if (per[i] > per[j])
				ans += j - i;
			counter++;
		}
	}
	cout << ans;
	return 0;
}
