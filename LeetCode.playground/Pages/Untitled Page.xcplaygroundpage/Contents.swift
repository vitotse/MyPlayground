//: [Previous](@previous)
import Foundation

/// 剑指 Offer 53 - II. 0～n-1中缺失的数字
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        
        var low = 0
        var high = nums.count - 1

        while low <= high {
            let mid = (low + high) / 2
            
            if nums[mid] <= mid {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return high + 1
    }
}

let nums = [0,1,2,4,5,6,7,8,9]
let solution = Solution()
let missNum = solution.missingNumber(nums)


//: [Next](@next)
