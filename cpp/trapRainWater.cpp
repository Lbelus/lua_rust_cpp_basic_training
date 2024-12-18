/* Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

 

Example 1:


Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
Example 2:

Input: height = [4,2,0,3,2,5]
Output: 9 */

class Solution {
public:
    int trap(vector<int>& height)
    {
        size_t left = 0, right = height.size() - 1;
        int max_left = 0, max_right = 0;
        int trapped = 0;
        
        while (left < right)
        {
            if (height[left] < height[right])
            {
                if (height[left] >= max_left)
                {
                    max_left = height[left];
                }
                else
                {
                    trapped += max_left - height[left];
                }
                left++;
            }
            else
            {
                if (height[right] >= max_right)
                {
                    max_right = height[right];
                }
                else
                {
                    trapped += max_right - height[right]; 
                }
                right--;
            }
        }
        return trapped;
    }
};
