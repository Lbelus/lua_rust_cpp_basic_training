
trait Arithmetics {
    fn add(left:i32, right:i32) -> i32;
    fn sub(left:i32, right:i32) -> i32;
    fn multiply(left:i32, right:i32) -> i32;
    fn divide(left:i32, right:i32) -> i32;
    fn modulo(left:i32, right:i32) -> i32;
    fn exponent(left:i32, right:i32) -> i32;
    fn is_operator(token:String) -> bool;
    fn is_number(s: String) -> bool;
}

struct Operators;

impl Arithmetics for Operators {

    fn add(left:i32, right:i32) -> i32 {
        return left + right;
    }
    fn sub(left:i32, right:i32) -> i32 {
        return left - right;
    }
    fn multiply(left:i32, right:i32) -> i32 {
        return left * right;
    }
    fn divide(left:i32, right:i32) -> i32 {
        return left / right;
    }
    fn modulo(left:i32, right:i32) -> i32 {
        return left % right;
    }
    fn exponent(left:i32, right:i32) -> i32 {
        return left ^ right;
    }
    fn is_operator(token:String) -> bool {
        let valid:[&str; 6] = ["+", "-", "*", "/", "^", "%"];
        for index in 0..6 {
            if valid[index] == token {
                return true;
            }
        }
    return false;
    }
    fn is_number(s: String) -> bool {
        s.parse::<i32>().is_ok()
    }
}

struct Operation {
    tokens:Vec<String>,
}

impl Operation {
    pub fn new(input:Vec<&str>) -> Self {
        Self {
            tokens: input
                .iter()
                .map(|s| s.to_string())
                .collect(),
        }
    }
    fn calculate(&self) -> i32 {
        let mut stack:Vec<i32> = Vec::new();
        for index in 0..self.tokens.len() {
            if Operators::is_number(self.tokens[index].clone()) {
                if let Ok(num) = self.tokens[index].parse::<i32>() {
                    stack.push(num);
                }
            } else if Operators::is_operator(self.tokens[index].clone()) {
                let right = stack.pop();
                let left = stack.pop();
                if let Some((left, right)) = left.zip(right) {
                    let result = match self.tokens[index].as_str() {
                        "+" => Operators::add(left, right),
                        "-" => Operators::sub(left, right),
                        "*" => Operators::multiply(left, right),
                        "/" => Operators::divide(left, right),
                        "%" => Operators::modulo(left, right),
                        "^" => Operators::exponent(left, right),
                        _ => 0,
                    };
                    stack.push(result);
                }
            }
        }
        stack[0]
    }
}

fn main() {
    {
        let input:Vec<&str> = vec!["1", "2", "+", "3", "*", "4"];       
    let operation = Operation::new(input);
    println!("{}",operation.calculate());
    }
    {
        let input:Vec<&str> = vec!["3", "4", "+", "2", "*"];          
    let operation = Operation::new(input);
    println!("{}",operation.calculate());
    }
    {
        let input:Vec<&str> = vec!["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"];
    let operation = Operation::new(input);
    println!("{}",operation.calculate());
    }
    {
        let input:Vec<&str> = vec![ "3", "2", "+", "4", "*" ];          
    let operation = Operation::new(input);
    println!("{}",operation.calculate());
    }
}