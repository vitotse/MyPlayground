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

/// 1342. 将数字变成 0 的操作次数
/// https://leetcode-cn.com/problems/number-of-steps-to-reduce-a-number-to-zero/
func numberOfSteps(_ num: Int) -> Int {

    var step = 0
    
    var temp = num
    
    while temp > 0 {
        if temp % 2 == 1 {
            temp -= 1
        } else {
            temp = temp / 2
        }
        step += 1

    }
    return step
    
}




//: [Next](@next)
