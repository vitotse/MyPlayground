//: [Previous](@previous)

/// 剑指 Offer 30. 包含min函数的栈
import Foundation

class MinStack {

    var stack = [Int]()
    
    init() {
        
    }
    
    func push(_ val: Int) {
        stack.append(val)
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func top() -> Int {
        guard let last = stack.last else {
            return 0
        }
        return last
    }
    
    func min() -> Int {
        var min: Int?
        for element in stack {
            if min == nil{
                min = element
                continue
            }else {
                if element < min! {
                    min = element
                }
            }
            
        }

        return min ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.min()
 */

let obj = MinStack()
obj.push(-2)
obj.push(0)
obj.push(-3)
obj.min()
obj.pop()
obj.min()
obj.pop()
obj.min()


//: [Next](@next)
