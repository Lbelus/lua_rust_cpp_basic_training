// Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.


// Example 1:

// Input: temperatures = [73,74,75,71,69,72,76,73]
// Output: [1,1,4,2,1,1,0,0]
// Example 2:

// Input: temperatures = [30,40,50,60]
// Output: [1,1,1,0]
// Example 3:

// Input: temperatures = [30,60,90]
// Output: [1,1,0]


pub fn daily_temperatures(temperatures: Vec<i32>) -> Vec<i32> {
    let mut stack:Vec<usize> = Vec::new();
    let len:usize = temperatures.len();
    let mut result = vec![0; len];
    for index in 0..len {
        while !stack.is_empty() && temperatures[index] >  temperatures[*stack.last().unwrap()] {
            let prev_index = stack.pop().unwrap();
            result[prev_index] = (index - prev_index) as i32;
        }
        stack.push(index);
    }
    result
}


pub fn main() {
    {
        let input:Vec<i32> = vec![73, 74, 75, 71, 69, 72, 76, 73];
        println!("{:?}", daily_temperatures(input))
    }
    {
        let input:Vec<i32> = vec![30, 40, 50, 60];
        println!("{:?}", daily_temperatures(input))
    }
    {
        let input:Vec<i32> = vec![30, 60, 90];
        println!("{:?}", daily_temperatures(input))
    }
}