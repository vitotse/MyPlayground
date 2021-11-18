//: [Previous](@previous)

/// 剑指 Offer 11. 旋转数组的最小数字
///https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/

import Foundation

class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        
        var low = 0
        var high = numbers.count - 1
        
        while low < high {

            let mid = low + (high - low) / 2
            
            if numbers[mid] < numbers[high] {
                high = mid

            }else if numbers[mid] > numbers[high] {
                low = mid + 1

            } else{
                high -= 1
                
            }

        }

        return numbers[low]
        
    }
}


let solution = Solution()
let min = solution.minArray([10,1,10,10,10])

///case
///[2,2,2,0,1]
///[3,4,5,6,7,2]
///[10,1,10,10,10]
print(min)
//: [Next](@next)
