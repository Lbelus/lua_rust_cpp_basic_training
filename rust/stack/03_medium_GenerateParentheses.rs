// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

// Example 1:

// Input: n = 3
// Output: ["((()))","(()())","(())()","()(())","()()()"]
// Example 2:

// Input: n = 1
// Output: ["()"]


// Constraints:

// 1 <= n <= 8



pub fn generate_parenthesis(n: i32) -> Vec<String> {
    let mut result:Vec<String> = Vec::new();
    let mut stack:Vec<(String, i32, i32)> = Vec::new();
    stack.push((String::from(""), 0, 0));
    while !stack.is_empty() {
        let (str, open, closed) = stack.pop().unwrap();
        if open == n && closed == n {
            result.push(str.clone());
        }
        if open < n {
            let new_str = str.clone() + "(";
            stack.push((new_str, open + 1, closed));
        }
        if closed < open {
            let new_str = str.clone() + ")";
            stack.push((new_str, open, closed + 1));
        }
    }
    result
}


pub fn main() {

    println!("{:?}", generate_parenthesis(1));
    println!("{:?}", generate_parenthesis(3));
}
