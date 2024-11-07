#include <iostream>
#include <string>
#include <vector>


using namespace std;

class Solution {
private:

    int max(int val_a, int val_b)
    {
        if (val_a > val_b)
        {
            return val_a;
        }
        return val_b;
    }



public:
    int largestCombination(vector<int>& candidates) {
        int max_counter = 0;
        int bit = 1;
        while (bit <= 32)
        {
            int count = 0;
            for (int num: candidates)
            {
                if (num & (1 << bit))
                {
                    count += 1;
                }
            }
            max_counter = max(max_counter, count);
            bit += 1;
        }
        return max_counter;
    }
};

int main(void)
{
    {
        Solution s;
        vector<int> vec = {16,17,71,62,12,24,14};
        cout << s.largestCombination(vec) << endl;  // Expected output: 4
    }
    {
        Solution s;
        vector<int> vec = {8, 8};
        cout << s.largestCombination(vec) << endl;  // Expected output: 2
    }
    {
        Solution s;
        vector<int> vec = {1, 2, 4, 8, 16};
        cout << s.largestCombination(vec) << endl;  // Expected output: 1
    }
    {
        Solution s;
        vector<int> vec = {7, 7, 7, 7};
        cout << s.largestCombination(vec) << endl;  // Expected output: 4 (since all bits are set in all numbers)
    }
    {
        Solution s;
        vector<int> vec = {1, 3, 7, 15, 31};
        cout << s.largestCombination(vec) << endl;  // Expected output: 5
    }
    {
        Solution s;
        vector<int> vec = {1024, 512, 256, 128};
        cout << s.largestCombination(vec) << endl;  // Expected output: 1
    }
    return EXIT_SUCCESS;
}
