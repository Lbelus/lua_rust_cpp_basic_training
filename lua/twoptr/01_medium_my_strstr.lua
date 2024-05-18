--[[Given two strings needle and haystack, 
return the index of the first occurrence of needle in haystack,
or -1 if needle is not part of haystack.

Example 1:

Input: haystack = "sadbutsad", needle = "sad"
Output: 0
Explanation: "sad" occurs at index 0 and 6.
The first occurrence is at index 0, so we return 0.
Example 2:

Input: haystack = "leetcode", needle = "leeto"
Output: -1
Explanation: "leeto" did not occur in "leetcode", so we return -1.]]--


-- print(string.format("char 1 : %s, char2: %s", char1, char2))

local function two_ptr(str, substr)
  for index = 1, #str do
    local char1 = str:sub(index, index)
    local char2 = substr:sub(1, 1)
    if char1 == char2 then
      for jndex = 1, #substr do
        char1 = str:sub((index - 1 + jndex), (index - 1 + jndex))
        char2 = substr:sub(jndex, jndex)
        if char1 ~= char2 then
          break
        end
        if jndex == #substr then
          return true
        end
      end
    end
  end
  return false
end

print(two_ptr("sadbutsad", "sad"))

print(two_ptr("leetcode", "leeto"))