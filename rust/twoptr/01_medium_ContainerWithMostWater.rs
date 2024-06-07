// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

// Find two lines that together with the x-axis form a container, such that the container contains the most water.

// Return the maximum amount of water a container can store.

// Notice that you may not slant the container.

// Example 1:

// Input: height = [1,8,6,2,5,4,8,3,7]
// Output: 49
// Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
// Example 2:

// Input: height = [1,1]
// Output: 1

// Constraints:

// n == height.length
// 2 <= n <= 105
// 0 <= height[i] <= 104

pub fn min(val_a: i32, val_b: i32) -> i32 {
    if val_a < val_b {
        return val_a;
    } else {
        return val_b;
    }
}
// brute force:
// pub fn max_area(height: Vec<i32>) -> i32 {
//     let mut max_area: i32 = 0;
//     let len = height.len();
//     for index in 0..len {
//         for jndex in index + 1..len {
//             let min_height: i32 = min(height[index], height[jndex]);
//             let area: i32 = min_height * (jndex as i32 - index as i32);
//             println!("min: {}, index: {}, area: {}", min_height, index, area);
//             if area > max_area {
//                 max_area = area;
//             }
//         }
//     }
//     max_area
// }


pub fn max_area(height: Vec<i32>) -> i32 {
    let mut left:usize = 0;
    let mut right:usize = height.len() - 1;
    let mut max_area = 0;
    while left < right {
        let min_height = Self::min(height[left], height[right]);
        let area = min_height * (right as i32 - left as i32 );
        if area > max_area {
            max_area = area;
        }
        if height[left] < height[right] {
            left += 1;
        } else {
            right -= 1;
        }
    }
    max_area
}


pub fn main() {
    println!("{:?}", max_area(vec![1, 8, 6, 2, 5, 4, 8, 3, 7]));
    println!("{:?}", max_area(vec![1, 1]));
    println!("{:?}", max_area(vec![4, 3, 2, 1, 4]));
}