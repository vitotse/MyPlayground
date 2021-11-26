//: [Previous](@previous)

import Foundation

/// 剑指 Offer 61. 扑克牌中的顺子
/// https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof/

class Solution {
    func isStraight(_ nums: [Int]) -> Bool {

        var minNum: Int = 13
        var maxNum: Int = 0
        
        /// 使用集合去重
        var repeatSet = Set<Int>()
        
        for num in nums {
            if num == 0 {
                continue
            }
            
            minNum = min(minNum, num)
            maxNum = max(maxNum, num)
            
            if repeatSet.contains(num) {
                return false
            } else {
                repeatSet.insert(num)
            }
        }
        
        /// 区间不超过 5
        return maxNum - minNum < nums.count
    }
}

let solution = Solution.init()
//let isStraight = solution.isStraight([1,2,3,4,5])

let isStraight = solution.isStraight([0,1,1,3,4])

//: [Next](@next)
