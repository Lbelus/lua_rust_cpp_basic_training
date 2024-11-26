#import <iostream>
#import <vector>
#import <algorithm>

using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<pair<int, int>> nums_index_vec;
        for (int index = 0; index < nums.size(); index++) {
            nums_index_vec.push_back({nums[index], index});
        }
        sort(nums_index_vec.begin(), nums_index_vec.end());
        size_t left = 0 , right = nums.size() - 1;
        vector<int> result;
        while (left < right) {
            int sum = nums_index_vec[left].first + nums_index_vec[right].first;
            if (sum == target) {
                result.push_back(nums_index_vec[left].second);
                result.push_back(nums_index_vec[right].second);
                return result;
            } else if (sum < target) {
                left += 1;
            } else {
                right -= 1; 
            }
        }
        return result;
    }
};


void runTests() {
    Solution solution;

    // Test 1: Simple case
    vector<int> nums1 = {2, 7, 11, 15};
    int target1 = 9;
    vector<int> result1 = solution.twoSum(nums1, target1);
    cout << "Test 1: ";
    for (int idx : result1) cout << idx << " ";
    cout << endl; // Expected: 0 1

    // Test 2: Unsorted input
    vector<int> nums2 = {3, 2, 4};
    int target2 = 6;
    vector<int> result2 = solution.twoSum(nums2, target2);
    cout << "Test 2: ";
    for (int idx : result2) cout << idx << " ";
    cout << endl; // Expected: 1 2

    // Test 3: Negative numbers
    vector<int> nums3 = {-1, -2, -3, -4, -5};
    int target3 = -8;
    vector<int> result3 = solution.twoSum(nums3, target3);
    cout << "Test 3: ";
    for (int idx : result3) cout << idx << " ";
    cout << endl; // Expected: 2 4

    // Test 4: No solution
    vector<int> nums4 = {1, 2, 3, 4};
    int target4 = 10;
    vector<int> result4 = solution.twoSum(nums4, target4);
    cout << "Test 4: ";
    if (result4.empty()) cout << "No solution";
    cout << endl; // Expected: No solution

    // Test 5: Single pair in large input
    vector<int> nums5 = {1, 3, 5, 7, 9, 11, 13};
    int target5 = 16;
    vector<int> result5 = solution.twoSum(nums5, target5);
    cout << "Test 5: ";
    for (int idx : result5) cout << idx << " ";
    cout << endl; // Expected: 2 4
}

int main() {
    runTests();
    return 0;
}
