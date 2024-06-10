// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

// Implement the MinStack class:

// MinStack() initializes the stack object.
// void push(int val) pushes the element val onto the stack.
// void pop() removes the element on the top of the stack.
// int top() gets the top element of the stack.
// int getMin() retrieves the minimum element in the stack.
// You must implement a solution with O(1) time complexity for each function.


struct MinStack {
    pub stack:Vec<i32>,
    pub min:Vec<i32>,
}


/** 
 * `&self` means the method takes an immutable reference.
 * If you need a mutable reference, change it to `&mut self` instead.
 */
impl MinStack {

    fn new() -> Self {
        Self { stack: Vec::new(), min: Vec::new() }
    }

    fn push(&mut self, val: i32) {
        self.stack.push(val);
        if let Some(min_val) = self.min.last() {
            if val <= *min_val {
                self.min.push(val);
            }
        } else {
            self.min.push(val);
        }
    }

    fn pop(&mut self) -> Option<i32> {
        if let Some(val) = self.stack.pop() {
            if let Some(min_val) = self.min.last() {
                    if  val == *min_val {
                        self.min.pop();
                    }
            }
            return Some(val);
        }
        None
    }

    fn top(&self) -> i32 {
        *self.stack.last().unwrap()
    }

    fn get_min(&self) -> i32 {
        if let Some(val) = self.min.last() {
            return *val;
        } else {
            panic!("The stack is empty")
        }
    }
}

// /**
//  * Your MinStack object will be instantiated and called as such:
//  * let obj = MinStack::new();
//  * obj.push(val);
//  * obj.pop();
//  * let ret_3: i32 = obj.top();
//  * let ret_4: i32 = obj.get_min();
//  */

pub fn main() {
     let mut obj = MinStack::new();
     obj.push(12);
     obj.pop();
     obj.push(24);
     let ret_3: i32 = obj.top();
     let ret_4: i32 = obj.get_min();
    println!("{}", ret_3);
    println!("{}", ret_4);
}