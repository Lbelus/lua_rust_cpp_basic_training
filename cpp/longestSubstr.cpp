#import <iostream>
#import <string>
#import <unordered_map>
using namespace std;

// class Solution {
// public:
//     int lengthOfLongestSubstring(string s) {
//         size_t max_len = 0;
//         size_t len = s.size();
//         size_t index = 0;
//         while (index < len) {
//             unordered_set<char> new_set;
//             size_t jndex = index;
//             while (jndex < len) {
//                 if (new_set.count(s[jndex])) {
//                     break;
//                 }
//                 new_set.insert(s[jndex]);
//                 jndex += 1;
//             }
//             size_t count = new_set.size();
//             if (max_len < count) {
//                 max_len = count;
//             }
//             index += 1;
//         }
//         return max_len;
//     }
// };

class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        size_t index = 0;
        size_t jndex = 0;
        size_t len = s.length();
        int max_substr = 0;
        unordered_map<char, int> char_map;
        while (index < len) {
            if (char_map.find(s[index]) != char_map.end() && char_map[s[index]] >= jndex)
            {
                jndex = char_map[s[index]] + 1;
            }
            char_map[s[index]] = index;
            int new_max = index - jndex + 1;
            if (max_substr < new_max) {
                max_substr = new_max;
            }
            index += 1;
        } 
        return max_substr;
    }
};

void runTests() {
    Solution solution;

    // Test Case 1: Normal input with repeated characters
    string test1 = "abcabcbb";
    cout << "Test 1: " << (solution.lengthOfLongestSubstring(test1) == 3 ? "Passed" : "Failed") << endl;

    // Test Case 2: All unique characters
    string test2 = "abcdef";
    cout << "Test 2: " << (solution.lengthOfLongestSubstring(test2) == 6 ? "Passed" : "Failed") << endl;

    // Test Case 3: Single character
    string test3 = "aaaaaa";
    cout << "Test 3: " << (solution.lengthOfLongestSubstring(test3) == 1 ? "Passed" : "Failed") << endl;

    // Test Case 4: Empty string
    string test4 = "";
    cout << "Test 4: " << (solution.lengthOfLongestSubstring(test4) == 0 ? "Passed" : "Failed") << endl;

    // Test Case 5: String with mixed characters
    string test5 = "pwwkew";
    cout << "Test 5: " << (solution.lengthOfLongestSubstring(test5) == 3 ? "Passed" : "Failed") << endl;

    // Test Case 6: String with spaces
    string test6 = "a b c a b c";
    cout << "Test 6: " << (solution.lengthOfLongestSubstring(test6) == 5 ? "Passed" : "Failed") << endl;

    // Test Case 7: String with numbers
    string test7 = "123456123";
    cout << "Test 7: " << (solution.lengthOfLongestSubstring(test7) == 6 ? "Passed" : "Failed") << endl;

    // Test Case 8: Large input
    string test8(10000, 'a'); // String of 10,000 'a's
    cout << "Test 8: " << (solution.lengthOfLongestSubstring(test8) == 1 ? "Passed" : "Failed") << endl;


    // Test Case 9: three char
    string test9 = "cdd"; // String with repeated character
    cout << "Test 9: " << (solution.lengthOfLongestSubstring(test9) == 2 ? "Passed" : "Failed") << endl;

}

int main() {
    runTests();
    return 0;
}
