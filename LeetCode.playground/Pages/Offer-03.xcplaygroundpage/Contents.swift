//: [Previous](@previous)

import Foundation

/* 剑指 Offer 03. 数组中重复的数字
 */

class Solution {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        
        var map = [Int: Int]()
        
        for num in nums {
            if map[num] != nil {
                return num
            } else {
                map[num] = num
            }
        }
        
        return 0
    }
}

let inputs = [2, 3, 1, 0, 2, 5, 3]
let solution = Solution.init()
solution.findRepeatNumber(inputs)
 
//: [Next](@next)
