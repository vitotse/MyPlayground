//: [Previous](@previous)

/// 剑指 Offer 10- I. 斐波那契数列
/// https://leetcode-cn.com/problems/fei-bo-na-qi-shu-lie-lcof/

import Foundation

class Solution {
    
    var numMap = [Int: Int]()
    func fib(_ n: Int) -> Int {
        
        if let cal = numMap[n] {
            return cal
        }
        
        if n == 0 {
            
            numMap[n] = 0
            
            return 0
        } else if n == 1 {
            
            numMap[n] = 1
            return 1
        }
        
        numMap[n] = self.fib(n - 1) + self.fib(n - 2)
        
        /// 1000000007 是最小的十位质数。模1000000007，可以保证值永远在int的范围内。
    
        return (self.fib(n - 1) + self.fib(n - 2))%1000000007
    }
}

let solution = Solution()
solution.fib(45)



//: [Next](@next)
