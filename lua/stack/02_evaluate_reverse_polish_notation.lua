OPERATORS = {}

function OPERATORS:new()
    local tbl = {}
    setmetatable(tbl, self)
    self.__index = self
    return tbl
end

function OPERATORS:add(left, right)
    return left + right
end

function OPERATORS:substract(left, right)
    return left - right
end

function OPERATORS:multiply(left, right)
    return left * right
end

function OPERATORS:divide(left, right)
    return left / right
end

function OPERATORS:exponentiation(left, right)
    return left ^ right
end

function OPERATORS:modulo(left, right)
    return left % right
end

function OPERATORS:is_operator(token)
    local valid_tokens = { '+', '-', '*', '/', '^', '%' }
    for index = 1, #valid_tokens do
        if valid_tokens[index] == token then
            return true
        end
    end
    return false
end

OPERATION = OPERATORS:new()

function OPERATION:new(args)
    local tbl = {}
    setmetatable(tbl, self)
    self.__index = self
    tbl.tokens = args
    return tbl
end

function OPERATION:calculate()
    local stack = {}
    for index = 1, #self.tokens do
        local token = self.tokens[index]
        if tonumber(token) then
            table.insert(stack, tonumber(token))
        elseif self:is_operator(token) then
            local right = table.remove(stack)
            local left = table.remove(stack)
            local result = nil
            if token == '+' then
                result = self:add(left, right)
            elseif token == '-' then
                result = self:substract(left, right)
            elseif token == '*' then
                result = self:multiply(left, right)
            elseif token == '/' then
                result = self:divide(left, right)
            elseif token == '^' then
                result = self:exponentiation(left, right)
            elseif token == '%' then
                result = self:modulo(left, right)
            end
            table.insert(stack, result);
        end
    end
    return stack[1]
end

-- the garbage collector is supposed to act by itself if a value become unreachable.
local operation = OPERATION:new({ "3", "4", "+", "2", "*" })
print(operation:calculate())
operation = OPERATION:new({"10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"})
print(operation:calculate())
operation = OPERATION:new({ "3", "2", "+", "4", "*" })
print(operation:calculate())
operation = OPERATION:new({ "5", "4", "7", "+", "*" })
print(operation:calculate())

-- Setting a value for nil can possibly help the garbage collection operations. 
-- seems like good practice anyway...
function OPERATION:cleanup()
    self.tokens = nil
end

operation:cleanup()

RPN = {}

function RPN:call(tokens)
    local rpn = OPERATION:new(tokens)
    local result = rpn:calculate()
    rpn:cleanup()
    return result
end

setmetatable(RPN, {
    __call = function(self, tokens)
        return self:call(tokens)
    end
})

print("as a function call")

print(RPN({ "5", "4", "7", "+", "*" }))
print(RPN({ "3", "2", "+", "4", "*" }))
print(RPN({ "10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+" }))