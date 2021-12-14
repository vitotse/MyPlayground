//: [Previous](@previous)

import Foundation

/// 704. 二分查找
/// https://leetcode-cn.com/problems/binary-search/
func search(_ nums: [Int], _ target: Int) -> Int {

    var low = 0
    var high = nums.count - 1
    while low <= high  {
        
        var mid = (high - low) / 2 + low

        let midNum = nums[mid]
        if midNum == target {
            return mid
        }else if midNum > target {
            high = mid - 1
        } else if midNum < target {
            low = mid + 1
        }
        
    }    
    
    return -1
}

let searchNums = [-1,0,3,5,9,12]
search(searchNums, 2)
//: [Next](@next)
