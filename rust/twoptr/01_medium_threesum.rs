// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

// Notice that the solution set must not contain duplicate triplets.



// Example 1:

// Input: nums = [-1,0,1,2,-1,-4]
// Output: [[-1,-1,2],[-1,0,1]]
// Explanation:
// nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
// nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
// nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
// The distinct triplets are [-1,0,1] and [-1,-1,2].
// Notice that the order of the output and the order of the triplets does not matter.
// Example 2:

// Input: nums = [0,1,1]
// Output: []
// Explanation: The only possible triplet does not sum up to 0.
// Example 3:

// Input: nums = [0,0,0]
// Output: [[0,0,0]]
// Explanation: The only possible triplet sums up to 0.


// {
//   "input": [-1, 0, 1, 2, -1, -4],
//   "expected_output": [[-1, -1, 2], [-1, 0, 1]]
// }

// {
//   "input": [1, 2, -2, -1],
//   "expected_output": []
// }

// {
//   "input": [-2, 0, 1, 1, 2],
//   "expected_output": [[-2, 0, 2], [-2, 1, 1]]
// }

// {
//   "input": [-1, -1, 2, 2],
//   "expected_output": [[-1, -1, 2]]
// }


// Constraints:

// 3 <= nums.length <= 3000
// -105 <= nums[i] <= 105
use std::collections::HashSet;

pub fn three_sum(nums: Vec<i32>) -> Vec<Vec<i32>> {
    let mut cpy_nums = nums.clone();
    cpy_nums.sort();
    let len = cpy_nums .len();
    let mut result:Vec<Vec<i32>> = Vec::new();
    let mut seen: HashSet<(i32, i32, i32)> = HashSet::new();
    for index in 0..len {
        let mut left = index + 1;
        let mut right = len - 1;
        while left < right {
            let sum = cpy_nums[index] + cpy_nums[left] + cpy_nums[right];
            if sum == 0 {
                let triplet = (cpy_nums[index], cpy_nums[left], cpy_nums[right]);
                if !seen.contains(&triplet) {
                    result.push(vec![cpy_nums[index], cpy_nums[left], cpy_nums[right]]);
                    seen.insert(triplet);
                }
                left += 1;
                right -= 1;
                    while left < right && cpy_nums[left] == cpy_nums[left - 1] {
                        left += 1;
                    }
                    while left < right && cpy_nums[right] == cpy_nums[right + 1] {
                        right -= 1;
                    }
            } else if sum < 0 {
                left += 1;
            } else {
                right -= 1;
            }
        }
    }
    result
}


fn main() {
    println!("{:?}", three_sum(vec![-1, 0, 1, 2, -1, -4]));
    println!("{:?}", three_sum(vec![1, 2, -2, -1]));
    println!("{:?}", three_sum(vec![-2, 0, 1, 1, 2]));
    println!("{:?}", three_sum(vec![-1, -1, 2, 2]));
    println!("{:?}", three_sum(vec![0, 0, 0, 0]));
    println!("{:?}", three_sum(vec![3,0,-2,-1,1,2]));
}