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


local minStack_a = {}


function minStack.pop(tbl)
    return table.remove(tbl)
end


function minStack_a.push(tbl, value)
    return table.insert(tbl, value)
end

function minStack_a.top(tbl)
    return tbl[-1]
end

function minStack_a.getMin(tbl)
    local min = math.maxinteger
    for index = 1, #tbl do
        if tbl[index] < min then
            min = tbl[index]
        end
    end
    return min
end



-- Approach using metatables, all hail Lua 

local Stack = {}

function Stack:new()
  MinStack = {
    stack = {},
    min_stack = {}
  }
  setmetatable(MinStack, self)
  self.__index = self
  return MinStack
end

function Stack:push(value)
  table.insert(self.stack, value)
  if #self.min_stack == 0 or value <= self.min_stack[#self.min_stack] then
    table.insert(self.min_stack, value)
  end
end

function Stack:pop()
  if #self.stack == 0 then
    error("Stack is empty.")
  else
    local value = table.remove(self.stack, #self.stack)
    if value == self.min_stack[#self.min_stack] then
      table.remove(self.min_stack)
      return value
    end
  end
end

function Stack:top()
  if #self.stack == 0 then
    error("Stack is empty.")
  else
    return self.stack[#self.stack]
  end
end

function Stack:min()
  if #self.stack == 0 then
    error("Stack is empty.")
  else
    return self.min_stack[#self.min_stack]
  end
end

local stack = Stack:new()

stack:push(5)
stack:push(2)
stack:push(4)
stack:push(1)

print(stack:min())
stack:pop()
print(stack:min())
stack:pop()
print(stack:min())
stack:pop()
print(stack:min())