// maximum_points.cpp
// Second Problem of First DS Project
// using bits/std instead of many libs
#include <bits/stdc++.h>
using namespace std;

const long long BASE = 1000000;

int gcd(int a, int b);

struct Point {
    int x, y;
};

int main()
{
    int n;
    cin >> n;

    vector<Point> points(n);
    for (auto& p : points) cin >> p.x >> p.y;

    if (n <= 2)
    {
        cout << n;
        return 0;
    }


    srand(time(0));
    random_shuffle(points.begin(), points.end());

    int max_points = 1;
    int iterations = min(n, 20);
    for (int i = 0; i < iterations; i++)
    {
        const Point& a = points[i];
        unordered_map<long long, int> slope_count;

        for (const Point& b : points)
        {
            if (a.x == b.x && a.y == b.y) continue;

            int dx = b.x - a.x;
            int dy = b.y - a.y;

            int g = gcd(dx, dy);
            dx /= g;
            dy /= g;

            if (dx < 0 || (dx == 0 && dy < 0))
                dx = -dx; dy = -dy;

            long long key = dx * BASE + dy;
            slope_count[key]++;
        }

        int current_max = 0;
        for (auto& entry : slope_count)
            max_points = max(max_points, entry.second + 1);
    }

    cout << max_points;
    return 0;
}

int gcd(int a, int b)
{
    if (b == 0)
        return a;
    return gcd(b, a % b);
}
