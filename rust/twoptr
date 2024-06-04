// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

// Given a string s, return true if it is a palindrome, or false otherwise.

// Example 1:

// Input: s = "A man, a plan, a canal: Panama"
// Output: true
// Explanation: "amanaplanacanalpanama" is a palindrome.
// Example 2:

// Input: s = "race a car"
// Output: false
// Explanation: "raceacar" is not a palindrome.
// Example 3:

// Input: s = " "
// Output: true
// Explanation: s is an empty string "" after removing non-alphanumeric characters.
// Since an empty string reads the same forward and backward, it is a palindrome.

pub fn is_palindrome(s: String) -> bool {
    let lower_case_str: String = s.to_lowercase();
    let chars: Vec<char> = lower_case_str
        .chars()
        .filter(|c| c.is_alphanumeric())
        .collect();
    let len: usize = chars.len();
    for index in 0..(len / 2) {
        let left = chars[index];
        let right = chars[len - 1 - index];
        if left != right {
            return false;
        }
        println!("First char: {}, Last char: {}", left, right);
    }
    return true;
}

fn main() {
    println!(
        "{}",
        is_palindrome(String::from("A man, a plan, a canal: Panama"))
    );
    println!("{}", is_palindrome(String::from("race a car")));
    println!("{}", is_palindrome(String::from(" ")));
    println!("{}", is_palindrome(String::from("0P")));
    println!("{}", is_palindrome(String::from("a")));
}
