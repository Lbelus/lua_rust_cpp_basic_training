-- A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

-- Given a string s, return true if it is a palindrome, or false otherwise.



-- Example 1:

-- Input: s = "A man, a plan, a canal: Panama"
-- Output: true
-- Explanation: "amanaplanacanalpanama" is a palindrome.
-- Example 2:

-- Input: s = "race a car"
-- Output: false
-- Explanation: "raceacar" is not a palindrome.
-- Example 3:

-- Input: s = " "
-- Output: true
-- Explanation: s is an empty string "" after removing non-alphanumeric characters.
-- Since an empty string reads the same forward and backward, it is a palindrome.

function isPalindrome(str)
    local new_str = string.lower(str)
    new_str = string.gsub(new_str, "[^%a]", "")
    local str_len = #new_str + 1
    for index = 1, str_len / 2 do
      local char1 = new_str:sub(index, index)
      local char2 = new_str:sub((str_len - index), (str_len - index))
      print(string.format("char 1 : %s, char2: %s", char1, char2))
      if char1 ~= char2 then
        return false
        elseif index == str_len / 2 then
          return true
      end
    end
  end
  
  print(isPalindrome("A man, a plan, a canal: Panama"))
  
  print(isPalindrome("race a car"))