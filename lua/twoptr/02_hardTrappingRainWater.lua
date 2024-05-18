-- Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

-- Example 1:


-- Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
-- Output: 6
-- Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
-- Example 2:

-- Input: height = [4,2,0,3,2,5]
-- Output: 9

-- Input: height = [1, 2, 3, 4]
-- Output: 0
-- Explanation: An increasing slope cannot trap any water.
-- height = [1, 2, 3, 4]

-- Input: height = [4, 3, 2, 1]
-- Output: 0
-- Explanation: A decreasing slope cannot trap any water.
-- height = [4, 3, 2, 1]

-- Input: height = [1, 0, 2, 0, 1]
-- Output: 2
-- Explanation: 1 unit of water is trapped between the first and third bars, and 1 unit is trapped between the third and fifth bars.
-- height = [1, 0, 2, 0, 1]


local function find_min(val_a, val_b)
    if val_a < val_b then
        return val_a
    else
        return val_b
    end
end

local function trap(height)
    local max_left  = 0
    local max_right = 0
    local len       = #height
    local min       = 0
    local trapped   = 0
    local water     = 0
    for index = 2, len do
        for left = 1, index do
            if max_left < height[left] then
                max_left = height[left]
            end
        end
        for right = index, len do
            if max_right < height[right] then
                max_right = height[right]
            end
        end
        min = find_min(max_left, max_right)
        water = min - height[index]
        if water > 0 then
            trapped = trapped + water
        end
        max_left = 0
        max_right = 0
    end
    return trapped
end


local result = trap({ 0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1 })
print(result)

result = trap({ 4, 2, 0, 3, 2, 5 })
print(result)

result = trap({ 1, 2, 3, 4 })
print(result)

result = trap({ 5, 4, 3, 2, 1 })
print(result)

result = trap({ 1, 0, 2, 0, 1 })
print(result)
