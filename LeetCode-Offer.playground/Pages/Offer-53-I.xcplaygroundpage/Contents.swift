//: [Previous](@previous)

import Foundation

//剑指 Offer 53 - I. 在排序数组中查找数字 I
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {

        var index = 0
        for num in nums {
            if num == target {
                index += 1
            }else if num > target {
                return index
            }
            
        }
        
        return index
    }
}

let array = [5,7,7,8,8,10]
let solution = Solution()
let times = solution.search(array, 8)
print(times)

//: [Next](@next)
