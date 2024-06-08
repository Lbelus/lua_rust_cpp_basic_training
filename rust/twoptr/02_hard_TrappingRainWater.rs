
// Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

// Example 1:


// Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
// Output: 6
// Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
// Example 2:

// Input: height = [4,2,0,3,2,5]
// Output: 9

// Input: height = [1, 2, 3, 4]
// Output: 0
// Explanation: An increasing slope cannot trap any water.
// height = [1, 2, 3, 4]

// Input: height = [4, 3, 2, 1]
// Output: 0
// Explanation: A decreasing slope cannot trap any water.
// height = [4, 3, 2, 1]

// Input: height = [1, 0, 2, 0, 1]
// Output: 2
// Explanation: 1 unit of water is trapped between the first and third bars, and 1 unit is trapped between the third and fifth bars.
// height = [1, 0, 2, 0, 1]



pub fn ft_min(val_a: i32, val_b: i32) -> i32 {
    if val_a < val_b {
        return val_a;
    } else {
        return val_b;
    }
}

pub fn trap(height: Vec<i32>) -> i32 {

    let mut max_left:i32 = 0;
    let mut max_right:i32 = 0;
    let len:usize = height.len();
    let mut min:i32;
    let mut trapped:i32 = 0;
    let mut water:i32 ;
    for index in 1..len {
        for left in 0..index {
            if max_left < height[left] {
                max_left = height[left];
            }
        }
        for right in index..len {
            if max_right < height[right] {
                max_right = height[right];
            }
        }
        min = ft_min(max_left, max_right);
        water = min - height[index];
        if water > 0 {
            trapped = trapped + water;
        }
        max_left = 0;
        max_right = 0;
    }
    trapped
}


pub fn main() {
    println!("{}",trap(vec![0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1 ]));
    println!("{}",trap(vec![4, 2, 0, 3, 2, 5 ]));
    println!("{}",trap(vec![1, 2, 3, 4 ]));
    println!("{}",trap(vec![5, 4, 3, 2, 1 ]));
    println!("{}",trap(vec![1, 0, 2, 0, 1]));
}

