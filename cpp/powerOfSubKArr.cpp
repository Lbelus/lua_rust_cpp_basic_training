#include <iostream>
#include <vector>
using namespace std;


// You are given an array of integers nums of length n and a positive integer k.

// The power of an array is defined as:

// Its maximum element if all of its elements are consecutive and sorted in ascending order.
// -1 otherwise.
// You need to find the power of all 
// subarrays
//  of nums of size k.

// Return an integer array results of size n - k + 1, where results[i] is the power of nums[i..(i + k - 1)].


// Solution,
//     result array to store maximum power;
//     max var to keep track of the greater max
//     Outer loop: I < arr.size();
//         max = -1
//         Inner loop: while j < k && i < i + 1
//             if max < arr[i]
//                 max = arr[i]
//         arr.push(max);
//     return result;



class Solution {
public:
    vector<int> resultsArray(vector<int>& nums, int k) {
        vector<int> result;
        int max = 0;
        size_t len = nums.size();
        size_t index = 0;
        if (len < k)
        {
            return result;
        }
        if (k == 1)
        {
            for (size_t i = 0; i < len; ++i)
            {
                result.push_back(nums[i]);
            }
            return result;
        }
        while (index <= len - k)
        {
            bool consecutive = true;
            max = -1 ;
            size_t jndex = index;
            while (jndex < index + k - 1)
            {
                if (nums[jndex] + 1 != nums[jndex + 1] )
                {
                    consecutive = false;
                    break;
                }
                if (max < nums[jndex + 1])
                {
                    max = nums[jndex + 1];
                }
                jndex += 1;
            }
            if (consecutive)
            {
                result.push_back(max);
            }
            else
            {
                result.push_back(-1);
            }
            index += 1;
        }
        return result;
    }
};


void printVector(const vector<int>& v) {
    for (int num : v) {
        cout << num << " ";
    }
    cout << endl;
}

int main() {
    Solution solution;

    // Test Case 1: Regular case
    vector<int> nums1 = {1, 2, 3, 4, 5};
    int k1 = 3;
    vector<int> result1 = solution.resultsArray(nums1, k1);
    printVector(result1); // Expected output: [3, 4, 5]

    // Test Case 2: Not consecutive
    vector<int> nums2 = {1, 3, 2, 4, 5};
    int k2 = 3;
    vector<int> result2 = solution.resultsArray(nums2, k2);
    printVector(result2); // Expected output: [-1, -1, 5]

    // Test Case 3: Small k value
    vector<int> nums3 = {1, 2, 3};
    int k3 = 1;
    vector<int> result3 = solution.resultsArray(nums3, k3);
    printVector(result3); // Expected output: [1, 2, 3]

    // Test Case 4: Large k value
    vector<int> nums4 = {1, 2, 3};
    int k4 = 4;
    vector<int> result4 = solution.resultsArray(nums4, k4);
    printVector(result4); // Expected output: []

    // Test Case 5: Single-element subarrays
    vector<int> nums5 = {10};
    int k5 = 1;
    vector<int> result5 = solution.resultsArray(nums5, k5);
    printVector(result5); // Expected output: [10]

    return 0;
}
