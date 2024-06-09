// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// An input string is valid if:

// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Every close bracket has a corresponding open bracket of the same type.


// Example 1:

// Input: s = "()"
// Output: true
// Example 2:

// Input: s = "()[]{}"
// Output: true
// Example 3:

// Input: s = "(]"
// Output: false


// Input: s = "{[()]({[]})}"
// Output: true
// Explanation: All brackets are properly nested and closed in the correct order.

// Input: s = "{[()]}[({})]{[}]"
// Output: false
// Explanation: The string "[({})]{[}]" contains a [ without a closing ] in the correct order.





pub fn is_open(ch: char) -> bool {
    if ch == '(' {
        return true;
    } else if ch == '{' {
        return true;
    } else if ch == '[' {
        return true;
    }
    return false;
}

pub fn return_close(ch: char) -> char {
    if ch == '(' {
        return ')';
    } else if ch == '{' {
        return '}';
    } else if ch == '[' {
        return ']';
    }
    return '\0';
}

pub fn is_valid(s: String) -> bool {
    let str:Vec<char> = s.chars().collect();
    let mut stack:Vec<char> = Vec::new();
    let len:usize = str.len();
    if len == 1 {
        return false;
    }
    for index in 0..len {
        if is_open(str[index]) {
            let ch:char = return_close(str[index]);
            stack.push(ch);
        } else {
            if let Some(ch) = stack.pop() {
                if str[index] != ch {
                    return false;
                }
            } else {
                return false;
            }
        }
    }
    if stack.len() > 0 {
        return false;
    }
    return true;
}


pub fn main() {
    println!("{}", is_valid(String::from("()")));
    println!("{}", is_valid(String::from("()[]{}")));
    println!("{}", is_valid(String::from("(]")));
    println!("{}", is_valid(String::from("{[()]({[]})}")));
    println!("{}", is_valid(String::from("{[()]}[({})]{[}]")));
    println!("{}", is_valid(String::from(")(){}")));
}

