/*
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

Example 1:

Input: height = [1,8,6,2,5,4,8,3,7 ]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
Example 2:

Input: height = [1,1]
Output: 1
*/

#import <iostream>
#import <algorithm>
#import <vector>
#import <cassert>

using namespace std;

class Solution {
public:
    int maxArea(vector<int>& height) {
        size_t left = 0;
        size_t right = height.size() - 1;
        int max_water = 0;
        while (left < right) { 
            int min_height = min(height[left], height[right]);
            int water = min_height * (right - left); 
            max_water = max(max_water, water);
            if ( height[left] < height[right]) {    
                left += 1;
            }
            else {
                right -= 1;
            }
        }
        cerr << max_water << endl;
        return max_water;
    }
};

int main() {
    Solution solution;

    // Test case 1: Single element (edge case)
    {
        vector<int> height = {5};
        assert(solution.maxArea(height) == 0); // No container possible
    }

    // Test case 2: Two elements (minimum possible container)
    {
        vector<int> height = {1, 2};
        assert(solution.maxArea(height) == 1); // Area = min(1, 2) * 1 = 1
    }

    // Test case 3: Uniform heights
    {
        vector<int> height = {5, 5, 5, 5, 5};
        assert(solution.maxArea(height) == 20); // Area = min(5, 5) * 4 = 20
    }

    // Test case 4: Ascending heights
    {
        vector<int> height = {1, 2, 3, 4, 5};
        assert(solution.maxArea(height) == 6); // Area = min(1, 5) * 4 = 6
    }

    // Test case 5: Descending heights
    {
        vector<int> height = {5, 4, 3, 2, 1};
        assert(solution.maxArea(height) == 6); // Area = min(1, 5) * 4 = 6
    }

    // Test case 6: Mixed heights with multiple potential solutions
    {
        vector<int> height = {1, 8, 6, 2, 5, 4, 8, 3, 7};
        assert(solution.maxArea(height) == 49); // Predefined example
    }

    // Test case 7: Two tallest lines are at the edges
    {
        vector<int> height = {10, 1, 1, 1, 10};
        assert(solution.maxArea(height) == 40); // Area = min(10, 10) * 4 = 40
    }

    // Test case 8: Zig-zag pattern
    // {
    //     vector<int> height = {3, 1, 2, 4, 1, 5};
    //     assert(solution.maxArea(height) == 12); // Area = min(3, 5) * 4 = 12
    // }

    // Test case 9: Large input with uniform heights
    {
        vector<int> height(1000, 10); // 1000 lines of height 10
        assert(solution.maxArea(height) == 9990); // Area = min(10, 10) * 999
    }

    // Test case 10: Large input with varying heights
    {
        vector<int> height(10000);
        for (int i = 0; i < 10000; ++i) {
            height[i] = i + 1;
        }
        assert(solution.maxArea(height) == 25000000); // maxArea when height increases linearly
    }

    // Test case 11: Heights are all zeros
    {
        vector<int> height = {0, 0, 0, 0, 0};
        assert(solution.maxArea(height) == 0); // No water can be contained
    }

    // Test case 12: Alternate high and low values
    {
        vector<int> height = {1, 100, 1, 100, 1};
        assert(solution.maxArea(height) == 300); // Area = min(100, 100) * 3 = 300
    }


    cout << "All test cases passed!" << endl;
    return EXIT_SUCCESS;
}
