print("ex00")
-- Exercise 1: Basic Metatable Setup
-- Objective: Learn how to set and retrieve a metatable.

-- Create a table called myTable.
-- Create a metatable called meta.
-- Set the metatable for myTable to meta.
-- Verify that the metatable has been set correctly by retrieving it.
-- Instructions:

-- Use setmetatable to assign meta as the metatable for myTable.
-- Use getmetatable to check if the metatable has been set correctly.


-- 1. Create a table
local myTable01 = {}

-- 2. Create a metatable
local meta01 = { info = "This is a metatable" }

-- 3. Set the metatable for myTable to meta
setmetatable(myTable01, meta01)

-- 4. Verify the metatable
local retrievedMeta = getmetatable(myTable01)
print(retrievedMeta)
print(retrievedMeta.info)


print("ex01")
-- Exercise 2: Adding Metamethods
-- Objective: Understand how to add metamethods to control table behavior.

-- Use the same myTable and meta from Exercise 1.
-- Add a __index metamethod to the metatable that returns a default value (e.g., "default") for any key that is not present in myTable.
-- Test the __index metamethod by accessing a non-existent key in myTable.
-- Instructions:

-- Define the __index metamethod in meta.
-- Access a key in myTable that does not exist to see the default value.

-- Add __index metamethod to meta
local myTable02 = {}

-- Define the metatable with __index metamethod
local meta02 = {
    __index = function(table, key)
        return "default"
    end
}

-- Set the metatable for myTable
setmetatable(myTable02, meta02)

-- Access a non-existent key in myTable
print(myTable02.nonExistentKey) -- Should print "default"

print("ex02")
-- Exercise 3: Protecting a Table with __newindex
-- Objective: Use the __newindex metamethod to control assignments to the table.

-- Create a new table called protectedTable.
-- Create a metatable for protectedTable that prevents any new keys from being added to the table.
-- Try adding a new key to protectedTable and observe the behavior.
-- Instructions:

-- Implement the __newindex metamethod in the metatable to prevent new keys.
-- Attempt to add a new key to protectedTable.

-- 1. Create a new table
local protectedTable = { type = "cat", age = 2, islong = true }

-- 2. Create a metatable to protect the table
local meta03 = {
    __newindex = function(table, key, value)
        if rawget(table, key) == nil then
            error("Cannot add new key: " .. key)
        else
            rawset(table, key, value)
        end
    end
}

setmetatable(protectedTable, meta03)
-- 3. Try adding a new key
protectedTable.type = "human"
protectedTable.age = 31
protectedTable.islong = false
-- will throw an error
-- protectedTable.name = "joe"


print("ex03")
-- Exercise 4: Arithmetic Metamethods
-- Objective: Understand how to use metamethods for arithmetic operations.

-- Create two tables a and b.
-- Define a metatable with the __add metamethod to add the values of corresponding keys in a and b.
-- Use the + operator to add a and b and print the result.
-- Instructions:

-- Implement the __add metamethod in the metatable.
-- Perform the addition of a and b.

-- 1. Create two tables
local a = {x = 1, y = 2}
local b = {x = 3, y = 4}

-- 2. Define a metatable with __add
local vector_mt = {
    __add = function(v1, v2)
        return {x = v1.x + v2.x, y = v1.y + v2.y}
    end
}

setmetatable(a, vector_mt)
setmetatable(b, vector_mt)

-- 3. Use the + operator to add a and b
local result = a + b
print(result.x, result.y)

print("ex04")
-- Exercise 5: Custom String Representation
-- Objective: Use the __tostring metamethod to customize the string representation of a table.

-- Create a table person with fields name and age.
-- Define a metatable for person that includes a __tostring metamethod to return a custom string representation of the table.
-- Print the person table.
-- Instructions:

-- Implement the __tostring metamethod in the metatable.
-- Print the person table to see the custom string representation.

-- 1. Create a table
local person = { name = "John", age = 30 }

-- 2. Define a metatable with __tostring
local print_metatable = {
    __tostring = function(table)
        return "My name is " .. table.name .. " and I am " .. table.age .. " years old."
    end
}

setmetatable(person, print_metatable)


-- 3. Print the person table
print(person)

print("ex05")
-- Exercise 6: Inheritance with Metatables
-- Objective: Use metatables to implement simple inheritance.

-- Create a base table Base with a method greet.
-- Create another table Derived that inherits from Base.
-- Call the greet method from an instance of Derived.
-- Instructions:

-- Set the metatable of Derived to Base using __index.
-- Create an instance of Derived and call the greet method.

-- 1. Create a base table
local Base = {}

function Base:new ()
    tbl = {}
    setmetatable(tbl, self)
    self.__index = self
    return tbl
end

function Base:greet ()
    print("Hello from Base")
end

Base.greet()

local base_instance = Base:new()
base_instance:greet ()


-- 2. Create a derived table
local Derived = Base:new ()

function Derived:greet ()
    print("hello from Derived")
end

Derived.greet()

-- 3. Call the greet method from an instance of Derived

local derived_instance = Derived:new()
derived_instance:greet()


