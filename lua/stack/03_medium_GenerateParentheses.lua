-- You are given an integer n. Return all well-formed parentheses strings that you can generate with n pairs of parentheses.

-- Example 1:

-- Input: n = 1

-- Output: ["()"]
-- Example 2:

-- Input: n = 3

-- Output: ["((()))","(()())","(())()","()(())","()()()"]

local function isEmpty(table)
    return next(table) == nil
end


local function generate_parenthesis(n)
    local result = {}
    local stack = {}
    table.insert(stack, {'', 0, 0})
    while not isEmpty(stack) do
        local current = table.remove(stack)
        local str = current[1]
        local open = current[2]
        local closed = current[3]
        if open == n and closed == n then
            table.insert(result, str)
        end
        if open < n then
            table.insert(stack, {str .. '(', open + 1, closed })
        end
        if closed < open then
            table.insert(stack, {str .. ')', open, closed + 1 })
        end
    end
    return result
end


print("test n = 1")
local n = 1
local parentheses_combinations = generate_parenthesis(n)
for i, combination in ipairs(parentheses_combinations) do
    print(combination)
end


print("test n = 3")
local n = 3
local parentheses_combinations = generate_parenthesis(n)
for i, combination in ipairs(parentheses_combinations) do
    print(combination)
end