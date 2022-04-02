//: [Previous](@previous)

import Foundation

/// 剑指 Offer 15. 二进制中1的个数
/// https://leetcode-cn.com/problems/er-jin-zhi-zhong-1de-ge-shu-lcof/solution/mian-shi-ti-15-er-jin-zhi-zhong-1de-ge-shu-wei-yun/
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var number = n
        var count = 0
        while number != 0 {
            if number % 2 == 1 {
                count += 1
            }
            number = number / 2
                
        }
        
        return count
    }
}

let solution = Solution()
let count = solution.hammingWeight(11)


/// 位运算
func hammingWeightWithAndOperate(_ n: Int) -> Int {
    var ret = 0
    
    for i in 0..<32 {
        
        let res = n & (1 << i)
        print("\(res)")
//        if res > 0 {
//            ret ++
//        }
        
    }
    return ret
}

let countO = hammingWeightWithAndOperate(11)

//: [Next](@next)
