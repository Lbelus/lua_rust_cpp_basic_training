-- Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

-- Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

-- The tests are generated such that there is exactly one solution. You may not use the same element twice.

-- Your solution must use only constant extra space.



-- Example 1:

-- Input: numbers = [2,7,11,15], target = 9
-- Output: [1,2]
-- Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
-- Example 2:

-- Input: numbers = [2,3,4], target = 6
-- Output: [1,3]
-- Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
-- Example 3:

-- Input: numbers = [-1,0], target = -1
-- Output: [1,2]
-- Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].



local function twoSum(numbers, target)
    local jndex
    local sum = 0
    for index = 1, #numbers do
      jndex = #numbers
      repeat
        sum = numbers[index] + numbers[jndex]
        if sum == target then
          return { index, jndex }
        end
        jndex = jndex - 1
      until (index == jndex)
    end
    return -1
  end
  
  
  local result = twoSum({ 2, 7, 11, 15 }, 9)
  print("[".. result[1] .."," .. result[2] .. "]")
  result = twoSum({ 2, 3, 4 }, 6)
  print("[".. result[1] .."," .. result[2] .. "]")
  result = twoSum({ -1, 0 }, -1)
  print("[".. result[1] .."," .. result[2] .. "]")