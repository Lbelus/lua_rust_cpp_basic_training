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