//: [Previous](@previous)
/// 剑指 Offer 56 - II. 数组中数字出现的次数 II
/// https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/
import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    
    var dict = [Int: Int]()
    
    for num in nums {
        if dict.keys.contains(num), let count = dict[num] {
            dict[num] = count + 1
        } else {
            dict[num] = 1
        }
    }
    
    let filterNum = dict.filter { (key, value) in
        
        if value < 3 {
            return true
        }
        
        return false
    }.map { dict in
        return dict.key
    }
    
    return filterNum[0]
}

let result = singleNumber([1,2,2,2,3,3,3])


//: [Next](@next)
