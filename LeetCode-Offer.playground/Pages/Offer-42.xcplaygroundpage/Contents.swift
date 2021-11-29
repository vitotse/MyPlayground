//: [Previous](@previous)

/// 剑指 Offer 42. 连续子数组的最大和
/// https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/
import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {

        var pre = 0
        var maxAns = nums.first!
        for index in 0..<nums.count {
            
            pre = max(nums[index], pre + nums[index])
            maxAns = max(pre, maxAns)
            print(maxAns)
        }
        
        return maxAns
    }
}

let solution = Solution.init()
//solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
solution.maxSubArray([1,2])

//: [Next](@next)
