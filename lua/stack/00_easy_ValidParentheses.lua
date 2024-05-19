-- Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

-- An input string is valid if:

-- Open brackets must be closed by the same type of brackets.
-- Open brackets must be closed in the correct order.
-- Every close bracket has a corresponding open bracket of the same type.


-- Example 1:

-- Input: s = "()"
-- Output: true
-- Example 2:

-- Input: s = "()[]{}"
-- Output: true
-- Example 3:

-- Input: s = "(]"
-- Output: false


-- Input: s = "{[()]({[]})}"
-- Output: true
-- Explanation: All brackets are properly nested and closed in the correct order.

-- Input: s = "{[()]}[({})]{[}]"
-- Output: false
-- Explanation: The string "[({})]{[}]" contains a [ without a closing ] in the correct order.




local function is_open(char)
    if char == '(' then
        return true
    elseif char == '{' then
        return true
    elseif char == '[' then
        return true
    end
    return false
end

local function return_close(char)
    if char == '(' then
        return ')'
    elseif char == '{' then
        return '}'
    elseif char == '[' then
        return "]"
    end
    return ''
end

function pop(tbl)
    return table.remove(tbl)
end

local function isValid(str)
    local stack = {}
    for index = 1, #str do
        if is_open(str:sub(index, index)) then
            table.insert(stack, return_close(str:sub(index, index)))
        elseif str:sub(index, index) ~= pop(stack) then
            return false
        end
    end
    return true
end

function print_table(table)
    for index = 1, #table do
        print(' ' .. table[index])
    end
end

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))
print(isValid("{[()]({[]})}"))
print(isValid("{[()]}[({})]{[}]"))
