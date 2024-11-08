/* A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise. */


class Solution {
public:
    string cleanString(string& str)
    {
        string new_string; 
        for(char ch: str)
        {
            if (ch >= 'A' && ch <= 'Z')
            {
                new_string += ch + 32;
            }
            else if (ch >= 'a' && ch <= 'z')
            {
                new_string += ch;
            }
            else if (ch >= '0' && ch <= '9')
            {
                new_string += ch;
            }
        }
        return new_string;
    }

    bool isPalindrome(string s) {
        if (s.empty())
        {
            return false;
        }        
        string new_string  = cleanString(s);
        size_t size = new_string.size();
        size_t index = 0;
        while (index < size / 2)
        {
            char ch1 = new_string[index];
            char ch2 = new_string[size - index - 1];
            if (ch1 != ch2)
            {
                return false;
            }
            index += 1;
        }
        return true;
    }
};
