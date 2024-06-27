-- Largest Rectangle In Histogram
-- You are given an array of integers heights where heights[i] represents the height of a bar. The width of each bar is 1.

-- Return the area of the largest rectangle that can be formed among the bars.

-- Note: This chart is known as a histogram.

-- Example 1:

-- Input: heights = [7,1,7,2,2,4]

-- Output: 8
-- Example 2:

-- Input: heights = [1,3,7]

-- Output: 7

local function isEmpty(table)
	return next(table) == nil
end

local function max(val_a, val_b)
	if val_a > val_b then
		return val_a
	end
	return val_b
end

local function largestRectangleArea(heights)
	local stack = {}
	local max_area = 0
	for index = 1, #heights do 
		local start = index
		while not isEmpty(stack) and stack[#stack][2] > heights[index] do
			local pair = table.remove(stack)
			max_area = max(max_area, (index - pair[1]) * pair[2])
			start = pair[1]
		end
		table.insert(stack, { start, heights[index] })
	end
	for index = 1, #stack do
		local pair = stack[index] 
		max_area = max(max_area, pair[2] * (#heights + 1  - pair[1]))
	end
	return max_area
end

