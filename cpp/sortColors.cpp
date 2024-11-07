#import <iostream>
#import <vector>

using namespace std;


class Solution {
public:
    void sortColors(vector<int>& nums) {
        if (nums.empty())
        {
            return;
        }
        bool swapped = true;
        size_t size = nums.size();
        size_t pos = 0;
        while (swapped)
        {
            swapped = false;
            int index = 0;
            while (index < size - pos - 1)
            {
                if (nums[index] > nums[index + 1])
                {
                    swap(nums[index], nums[index + 1]);
                    swapped = true;
                }
                index += 1;
            }
            if (!swapped)
            {
                break;
            }
            pos += 1;
        }
    }

    void checkVec(const vector<int>& nums)
    {
        cerr << "\033[31m" << "vector: [" ;
        for (vector<int>::const_iterator it = nums.begin(); it != nums.end(); ++it)
        {
            cerr << *it << " ";
        }
        cerr << "]"<< "\033[0m" << endl;
    }
};

int main()
{
    {
        Solution s;
        vector<int> vec = {2,0,2,1,1,0};
        s.sortColors(vec);
		s.checkVec(vec);
    }

    {
        Solution s;
        vector<int> vec = {2,0,1};
        s.sortColors(vec);
		s.checkVec(vec);
    }

    return EXIT_SUCCESS;
}
