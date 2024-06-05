// [[Given two strings needle and haystack,
// return the index of the first occurrence of needle in haystack,
// or -1 if needle is not part of haystack.

// Example 1:

// Input: haystack = "sadbutsad", needle = "sad"
// Output: 0
// Explanation: "sad" occurs at index 0 and 6.
// The first occurrence is at index 0, so we return 0.
// Example 2:

// Input: haystack = "leetcode", needle = "leeto"
// Output: -1
// Explanation: "leeto" did not occur in "leetcode", so we return -1.]]--

pub fn str_str(haystack: String, needle: String) -> i32 {
    let str: Vec<char> = haystack.chars().collect();
    let substr: Vec<char> = needle.chars().collect();
    let str_len: usize = str.len();
    let sub_len: usize = substr.len();
    if str_len < sub_len {
        return -1;
    }
    // println!("len1: {}, len2 {}", str_len, sub_len);
    for index in 0..str_len {
        if str[index] == substr[0] {

            for jndex in 0..sub_len {
                let char1 = str[index + jndex];
                let char2 = substr[jndex];
                // println!("char1: {}, char2 {}", char1, char2);
                if char1 != char2 {
                    break;
                }
                if jndex == sub_len - 1 {
                    return index as i32;
                }
            }
        }
        if index + sub_len >= str_len {
            return -1;
        }
    }
    -1
}

fn main() {
    println!(
        "{}",
        str_str(String::from("sadbutsad"), String::from("sad"))
    );
    println!(
        "{}",
        str_str(String::from("a"), String::from("a"))
    );
}