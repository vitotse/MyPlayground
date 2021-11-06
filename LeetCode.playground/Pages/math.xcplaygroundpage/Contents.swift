//: [Previous](@previous)

import Foundation

// https://leetcode-cn.com/problems/valid-perfect-square/

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var n:Int = 1
        var number = num
        while number > 0 {
            number -= n
            n += 2
            print(number)
        }
        
        if number == 0 {
            return true
        }else {
            return false
        }
    }
}

let solution = Solution.init()
print("solution: \(solution.isPerfectSquare(16))")


//: [Next](@next)
