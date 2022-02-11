//: [Previous](@previous)

/// 剑指 Offer 56 - I. 数组中数字出现的次数
/// https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/
import Foundation

func singleNumbers(_ nums: [Int]) -> [Int] {
    
    var result = [Int]()
    for num in nums {
        
        if let index = result.firstIndex(of: num) {
            result.remove(at: index)
        } else {
            result.append(num)
        }
    }
    return result
    
}

let nums = singleNumbers([1,2,3,4,5,6,7,2,3,4,5,6])
print(nums)

//: [Next](@next)
