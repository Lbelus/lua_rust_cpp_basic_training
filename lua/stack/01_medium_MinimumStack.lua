-- Design a stack class that supports the push, pop, top, and getMin operations.

-- MinStack() initializes the stack object.
-- void push(int val) pushes the element val onto the stack.
-- void pop() removes the element on the top of the stack.
-- int top() gets the top element of the stack.
-- int getMin() retrieves the minimum element in the stack.
-- Each function should run in 
-- �
-- (
-- 1
-- )
-- O(1) time.

-- Example 1:

-- Input: ["MinStack", "push", 1, "push", 2, "push", 0, "getMin", "pop", "top", "getMin"]

-- Output: [null,null,null,null,0,null,2,1]

-- Explanation:
-- MinStack minStack = new MinStack();
-- minStack.push(1);
-- minStack.push(2);
-- minStack.push(0);
-- minStack.getMin(); // return 0
-- minStack.pop();
-- minStack.top();    // return 2
-- minStack.getMin(); // return 1
-- Constraints:

-- -2^31 <= val <= 2^31 - 1.
-- pop, top and getMin will always be called on non-empty stacks.


-- fisrt Naive approach, it needs to rely on metatables 
-- and keep track of minimum values through an array 
-- instead of searching for it by iterating over the stack. 


local minStack = {}


function minStack.pop(tbl)
    return table.remove(tbl)
end


function minStack.push(tbl, value)
    return table.insert(tbl, value)
end

function minStack.top(tbl)
    return tbl[-1]
end

function minStack.getMin(tbl)
    local min = math.maxinteger
    for index = 1, #tbl do
        if tbl[index] < min then
            min = tbl[index]
        end
    end
    return min
end