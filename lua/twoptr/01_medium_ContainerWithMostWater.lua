-- You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

-- Find two lines that together with the x-axis form a container, such that the container contains the most water.

-- Return the maximum amount of water a container can store.

-- Notice that you may not slant the container.



-- Example 1:


-- Input: height = [1,8,6,2,5,4,8,3,7]
-- Output: 49
-- Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.


-- bruteforce:
function ft_min_height(val_a, val_b)
    if (val_a < val_b) then
      return val_a
    else
      return val_b
    end
  end

--   local function maxArea(height)
--     local max_area = 0
--     local min_height = 0
--     local area = 0
--     local len = #height
--     for index = 1, len do
--       for kndex = index + 1, len do
--         min_height = ft_min_height(height[index], height[kndex])
--         area = min_height  * index
--         if area > max_area then
--           max_area = area
--         end
--       end
--     end
--     return max_area
--   end

local function maxArea(height)
    local left, right = 1, #height
    local max_area = 0

    while left < right do
        local min = ft_min_height(height[left], height[right])
        local area = min * (right - left)
        if area > max_area then
            max_area = area
        end

        if height[left] < height[right] then
            left = left + 1
        else
            right = right - 1
        end
    end
    return max_area
end



  RESULT = maxArea({1,8,6,2,5,4,8,3,7})
  print(RESULT)
  
  RESULT = maxArea({1,1})
  print(RESULT)

  RESULT = maxArea({4, 3, 2, 1, 4})
  print(RESULT)