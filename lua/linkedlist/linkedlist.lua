-- Exercise 1: Define a Node
-- Task: Create a Node class in Lua.

-- Instructions:

-- Define a Node table.
-- Write a constructor function to initialize a node with a value and a next pointer.
Node = {}
Node.__index = Node

function Node:new(val)
    local new_node = {}
    setmetatable(new_node, Node)
    new_node.value = value
    new_node.next = nil
    return new_node
end

-- Exercise 2: Create a Linked List
-- Task: Create a LinkedList class in Lua.

-- Instructions:

-- Define a LinkedList table.
-- Write a constructor function to initialize an empty linked list.

LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:new()
    local list = {}
    setmetatable{list, LinkedList}
    list.head = nil
    return list
end

-- Exercise 3: Add a Node to the End
-- Task: Implement a method to add a node to the end of the linked list.

-- Instructions:

-- Add a method append to the LinkedList table.
-- The method should create a new node and add it to the end of the list.


function LinkedList:insert_at_head(node_to_insert)
    node.next = self.head;
    self.head = node
end


-- function LinkedList:insert_node(node)
--     if self.head == nil then
--         self.head = node
--     else
--         local iterator = self.head
--         while iterator.next do
--             iterator = iterator.next
--         end
--     iterator.next = node
--     end
-- end

-- Exercise 4: Print the Linked List
-- Task: Implement a method to print all the values in the linked list.

-- Instructions:

-- Add a method printList to the LinkedList table.
-- The method should traverse the list and print each node's value.


-- Exercise 5: Remove a Node by Value
-- Task: Implement a method to remove a node by its value from the linked list.

-- Instructions:

-- Add a method remove to the LinkedList table.
-- The method should find the node with the given value and remove it from the list.