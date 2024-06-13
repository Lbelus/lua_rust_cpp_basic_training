-- Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.


-- Example 1:

-- Input: temperatures = [73,74,75,71,69,72,76,73]
-- Output: [1,1,4,2,1,1,0,0]
-- Example 2:

-- Input: temperatures = [30,40,50,60]
-- Output: [1,1,1,0]
-- Example 3:

-- Input: temperatures = [30,60,90]
-- Output: [1,1,0]

local function isEmpty(table)
    return next(table) == nil
end

local function daily_temperatures(temperatures)
    local stack = {}
    local result = {}
    for index = 1, #temperatures do
        result[index] = 0
    end
    for index, temp in ipairs(temperatures) do
        while not isEmpty(stack) and temp > temperatures[stack[#stack]] do
            local prev_index = table.remove(stack)
            result[prev_index] = index - prev_index
        end
        table.insert(stack, index)
    end
    return result
end

-- daily_temperatures({ 73, 74, 75, 71, 69, 72, 76, 73 })
print("test1")
local days = daily_temperatures({ 73, 74, 75, 71, 69, 72, 76, 73 })
for i, day in ipairs(days) do
    print(day)
end
print("test2")
local days = daily_temperatures({ 30, 40, 50, 60 })
for i, day in ipairs(days) do
    print(day)
end
print("test3")
local days = daily_temperatures({ 30, 60, 90 })
for i, day in ipairs(days) do
    print(day)
end
