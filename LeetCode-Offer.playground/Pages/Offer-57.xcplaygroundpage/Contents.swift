//: [Previous](@previous)

/// 剑指 Offer 57. 和为s的两个数字
/// https://leetcode-cn.com/problems/he-wei-sde-liang-ge-shu-zi-lcof/
import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        let count = nums.count
        var index1 = 0
        var index2 = count - 1
        
        while index1 < index2 {
            
            let sum = nums[index1] + nums[index2]
            if sum == target {
                return [nums[index1], nums[index2]]
            }else if sum > target {
                index2 -= 1
            }else {
                index1 += 1
            }
        }
        
        return []
    }
}

let numbers = [14,15,16,22,53,60]//[1,3,5,6,7,8,9,12]
let solution = Solution()
let nums = solution.twoSum(numbers, 76)


//: [Next](@next)
