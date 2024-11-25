#import <iostream>
#import <set>
#import <vector>
#import <cassert>

using namespace std;

class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        std::set<int> nums_set(nums.begin(), nums.end());
        nums.assign(nums_set.begin(), nums_set.end());        
        return nums.size();
    }
};



void testRemoveDuplicates() {
    Solution solution;

    // Test Case 1: Basic test
    vector<int> nums1 = {1, 1, 2};
    int len1 = solution.removeDuplicates(nums1);
    assert(len1 == 2);
    assert(nums1 == vector<int>({1, 2}));

    // Test Case 2: No duplicates
    vector<int> nums2 = {1, 2, 3};
    int len2 = solution.removeDuplicates(nums2);
    assert(len2 == 3);
    assert(nums2 == vector<int>({1, 2, 3}));

    // Test Case 3: All duplicates
    vector<int> nums3 = {5, 5, 5, 5};
    int len3 = solution.removeDuplicates(nums3);
    assert(len3 == 1);
    assert(nums3 == vector<int>({5}));

    // Test Case 4: Empty vector
    vector<int> nums4 = {};
    int len4 = solution.removeDuplicates(nums4);
    assert(len4 == 0);
    assert(nums4.empty());

    // Test Case 5: Mixed order
    vector<int> nums5 = {4, 2, 2, 3, 4, 1};
    int len5 = solution.removeDuplicates(nums5);
    assert(len5 == 4);
    assert(nums5 == vector<int>({1, 2, 3, 4}));

    cout << "All test cases passed!" << endl;
}

int main() {
    testRemoveDuplicates();
    return 0;
}
