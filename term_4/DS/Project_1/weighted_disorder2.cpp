// weighted_disorder.cpp
// First Problem of First DS Project
#include <iostream>
#include <vector>

using namespace std;

long long result = 0;
vector<int> indexes(300005);

void mergeSort(int arr[], int left, int right);
void compare(int arr[], int left, int mid, int right);

int main()
{
	int n;
	cin >> n;

	int per[n];
	for (int i = 0; i < n; i++)
	{
		cin >> per[i];
		indexes[per[i]] = i;
	}

	mergeSort(per, 0, n - 1);

	cout << result;
	return 0;
}

void mergeSort(int arr[], int left, int right)
{
	if (left < right)
	{
		int mid = left + (right - left) / 2;
		mergeSort(arr, left, mid);
		mergeSort(arr, mid + 1, right);

		compare(arr, left, mid, right);
	}
}

void compare(int arr[], int left, int mid, int right)
{
	int n1 = mid - left + 1;
	int n2 = right - mid;

	int L[n1], R[n2];
	long long prefix_sum[n1 + 1];
	prefix_sum[0] = 0;

	for (int i = 0; i < n1; ++i)
	{
		L[i] = arr[left + i];
		prefix_sum[i + 1] = prefix_sum[i] + indexes[L[i]];
	}

	for (int j = 0; j < n2; ++j)
	{
		R[j] = arr[mid + 1 + j];
	}

	int i = 0, j = 0, k = left;
	while (i < n1 && j < n2)
	{
		if (L[i] > R[j])
		{
			long long cnt = n1 - i;
			long long sum_L = prefix_sum[n1] - prefix_sum[i];
			result += ( (long long)indexes[R[j]] * cnt ) - sum_L;
			arr[k++] = R[j++];
		} else {
			arr[k++] = L[i++];
		}
	}

	while (i < n1) arr[k++] = L[i++];
	while (j < n2) arr[k++] = R[j++];
}
