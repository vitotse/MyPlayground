//: [Previous](@previous)

/// 剑指 Offer 39. 数组中出现次数超过一半的数字
/// https://leetcode-cn.com/problems/shu-zu-zhong-chu-xian-ci-shu-chao-guo-yi-ban-de-shu-zi-lcof/
import Foundation

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var countMap = [Int:Int]()
        let half = nums.count / 2
        for num in nums{
            if let count = countMap[num]{
              countMap[num] = count+1
            
            }else{
                countMap[num] = 1
            }
            
            if let checkCount = countMap[num], checkCount > half {
                return num
            }
            
        }
        return 0
    }
}
//: [Next](@next)
