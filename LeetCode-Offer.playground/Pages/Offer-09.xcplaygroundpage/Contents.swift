//: [Previous](@previous)

/// 剑指 Offer 09. 用两个栈实现队列
import Foundation




class CQueue {

    private var stack1 = [Int]()
    private var stack2 = [Int]()
    init() {

    }
    
    func appendTail(_ value: Int) {
        
        if stack2.count > 0 {
            while stack2.count != 0 {
                
                let pop = stack2.popLast()!
                stack1.append(pop)
            }
        }
        
        stack1.append(value)

    }
    
    func deleteHead() -> Int {
        
        guard stack2.count == 0 else {
            return stack2.popLast()!
        }

        while stack1.count != 0 {
            
            let last = stack1.popLast()
            if stack1.count == 0 {
                return last!
            } else {
                stack2.append(last!)
            }
        }
        
        return -1
    }
    
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */

let obj = CQueue()
let ret_nil: Int = obj.deleteHead()
obj.appendTail(2)
obj.appendTail(5)
let ret_2: Int = obj.deleteHead()
let ret_3: Int = obj.deleteHead()
let ret_4: Int = obj.deleteHead()


//: [Next](@next)
