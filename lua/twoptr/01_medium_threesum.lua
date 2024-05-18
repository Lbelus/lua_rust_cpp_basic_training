-- Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

-- Notice that the solution set must not contain duplicate triplets.



-- Example 1:

-- Input: nums = [-1,0,1,2,-1,-4]
-- Output: [[-1,-1,2],[-1,0,1]]
-- Explanation:
-- nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
-- nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
-- nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
-- The distinct triplets are [-1,0,1] and [-1,-1,2].
-- Notice that the order of the output and the order of the triplets does not matter.
-- Example 2:

-- Input: nums = [0,1,1]
-- Output: []
-- Explanation: The only possible triplet does not sum up to 0.
-- Example 3:

-- Input: nums = [0,0,0]
-- Output: [[0,0,0]]
-- Explanation: The only possible triplet sums up to 0.


-- {
--   "input": [-1, 0, 1, 2, -1, -4],
--   "expected_output": [[-1, -1, 2], [-1, 0, 1]]
-- }

-- {
--   "input": [1, 2, -2, -1],
--   "expected_output": []
-- }

-- {
--   "input": [-2, 0, 1, 1, 2],
--   "expected_output": [[-2, 0, 2], [-2, 1, 1]]
-- }

-- {
--   "input": [-1, -1, 2, 2],
--   "expected_output": [[-1, -1, 2]]
-- }


-- Constraints:

-- 3 <= nums.length <= 3000
-- -105 <= nums[i] <= 105




local function check_sum(val_a, val_b, val_c)
    if val_a + val_b + val_c == 0 then
      return true
    end
    return false
  end
  
  local function threeSum(nums)
    table.sort(nums)
    local left   = 0
    local right  = 0
    local len    = #nums
    local result = {}
    for index = 1, len - 1 do
      left = index + 1
      right = len
      while left < right do
        if check_sum(nums[index], nums[left], nums[right]) then
          local sub_table = {nums[index], nums[left], nums[right]}
          table.insert(result, sub_table)
        end
        left = left + 1
        right = right - 1
      end
    end
    return result
  end
  
  
  local function print_result(arr)
  
      io.write("{")
  
    for i = 1, #arr do
      local subarr = arr[i]
      io.write("{")
      for j = 1, #subarr do
        io.write(subarr[j] .. ", ")
      end
      if i ~= #arr then
        io.write("}, ")
      else
        io.write("}")
      end
    end
  
      io.write("}\n")
  
  end
  
  
  local result
  result = threeSum({ -1, 0, 1, 2, -1, -4 })
  print_result(result)
  
  
  result = threeSum({0,1,1})
  print_result(result)
  
  result = threeSum({0,0,0})
  print_result(result)
  
  result = threeSum({-1, 0, 1, 2, -1, -4})
  print_result(result)
  
  result = threeSum({1, 2, -2, -1})
  print_result(result)
  
  result = threeSum({-2, 0, 1, 1, 2})
  print_result(result)
  
  result = threeSum({-1, -1, 2, 2})
  print_result(result)
  