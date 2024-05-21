-- https://www.lua.org/pil/7.1.html

print("ex00")

-- Exercise 1: Basic Iterator Function
-- Objective: Create a basic iterator function.

-- Task: Write an iterator function count_to_ten that iterates from 1 to 10.

function count_to_ten()
    local index = 0
    local count = 10
    return function()
        index = index + 1
        if index <= count then
            return index
        end
    end
end

for number in count_to_ten() do
    print(number)
end

print("ex01")

-- Exercise 2: Stateful Iterator
-- Objective: Create a stateful iterator.

-- Task: Write a stateful iterator range that takes two arguments start and stop, and iterates from start to stop

function range(start, stop)
    local index = start - 1
    local count = stop
    return function()
        index = index + 1
        if index <= count then
            return index
        end
    end 
end

for number in range(5, 10) do
    print(number)
end

print("\nex02")

-- Exercise 3: Infinite Iterator
-- Objective: Create an infinite iterator.

-- Task: Write an iterator infinite_count that starts from a given number and increments indefinitely.


function infinite_count(start)
    local index = start - 1
    return function()
        index = index + 1
        return index
    end
end

-- Be careful with infinite loops!
for number in infinite_count(1) do
    print(number)
    if number > 20 then break end
end

print("\nex03")

-- Exercise 4: Generic for-loop with Custom Iterator
-- Objective: Use a custom iterator with a generic for-loop.

-- Task: Create a custom iterator even_numbers that yields even numbers up to a given limit.

function even_numbers(limit)
    local index = 0
    return coroutine.wrap(function()
        while index < limit do
            index = index + 1
            if index % 2 == 0 then
                coroutine.yield(index)
            end
        end
    end)
end

for number in even_numbers(20) do
    print(number)
end

print("\nex04")

-- Exercise 5: File Lines Iterator
-- Objective: Read lines from a file using an iterator.

-- Task: Write an iterator function file_lines that yields each line from a file.

function file_lines(filename)
    local file = io.open(filename, "r")
    if not file then
        error("Could not open file " .. filename)
    end

    return function()
        local line = file:read()
        if not line then
            file:close()
        end
        return line
    end
end

for line in file_lines("example.txt") do
    print(line)
end

print("\nex05")
-- Exercise 6: Iterator with Custom Step
-- Objective: Create an iterator that uses a custom step.

-- Task: Write an iterator function range_with_step that takes three arguments: start, stop, and step. It should iterate from start to stop with the given step.

function range_with_step(start, stop, step)
    local index = start - step
    local count = stop
    return function()
        index = index + step
        if (index <= count) then
            return index
        end
    end
end

for number in range_with_step(1, 10, 2) do
    print(number)
end

print("\nex06")
-- Exercise 7: Fibonacci Sequence Iterator
-- Objective: Implement an iterator for the Fibonacci sequence.

-- Task: Write an iterator function fibonacci that yields numbers in the Fibonacci sequence up to a given limit.


-- for n > 1
-- Fn = Fn-1 +Fn-2
function fibonacci(limit)
    local base  = 0
    local index = 1
    return function()
        local curr = base
        if curr > limit then
            return nil
        end
        base, index = index, base + index
        return curr
    end
end

for number in fibonacci(100) do
    print(number)
end

print("\nex07")
-- Exercise 8: Filtered Iterator
-- Objective: Create an iterator that filters values.

-- Task: Write an iterator filtered that takes another iterator and a predicate function. It should yield only the values for which the predicate returns true.

function filtered(iterator, predicate)
    return function()
        local val
        repeat
            val = iterator()
            if val and predicate(val) then
                return val
            end
        until not val
    end
end

function is_even(x)
    return x % 2 == 0
end

for number in filtered(range(1, 10), is_even) do
    print(number)
end

-- Exercise 9: Nested Iterators
-- Objective: Use nested iterators.

-- Task: Write a function nested_iterator that display a nested table

local nestedTable = {
    { 1, 2, 3 },
    { 4, 5, 6 },
    { 7, 8, 9 }
}

function nested_iterator(tbl)
    local i, j = 0, 0
    local outer, inner = #tbl, 0

    return function()
        j = j + 1
        if j > inner then
            i = i + 1
            if i > outer then
                return nil
            end
            inner = #tbl[i]
            j = 1
        end
        return tbl[i][j]
    end
end

for element in nested_iterator(nestedTable) do
    print(element)
end


print("\nex09")
-- Exercise 10: Iterator Composition
-- Objective: Compose iterators.

-- Task: Write a function compose_iterators that takes two iterators and returns an iterator that yields values from the first iterator followed by values from the second iterator.

function compose_iterators(iter1, iter2)
    local iter1_done = false
    local iter2_done = false

    return function()
        if not iter1_done then
            local value = iter1()
            if value ~= nil then
                return value
            else
                iter1_done = true
            end
        end

        if not iter2_done then
            local value = iter2()
            if value ~= nil then
                return value
            else
                iter2_done = true
            end
        end
    end
end

function tableIterator(tbl)
    local i = 0
    local n = #tbl
    return function()
        i = i + 1
        if i <= n then
            return tbl[i]
        end
    end
end

local items1 = { 1, 2, 3 }
local items2 = { 4, 5, 6 }

local iter1 = tableIterator(items1)
local iter2 = tableIterator(items2)
local composedIter = compose_iterators(iter1, iter2)

for item in composedIter do
    print(item)
end