//: [Previous](@previous)

/// 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
/// https://leetcode-cn.com/problems/diao-zheng-shu-zu-shun-xu-shi-qi-shu-wei-yu-ou-shu-qian-mian-lcof/

import Foundation

class Solution {
    /// 使用两个数组分开奇偶数
//    func exchange(_ nums: [Int]) -> [Int] {
//
//        var oddNumber = [Int]()
//        var evenNumber = [Int]()
//
//        for num in nums {
//
//            if num % 2 == 0 {
//                evenNumber.append(num)
//            }else {
//                oddNumber.append(num)
//            }
//        }
//
//        var numbers = oddNumber
//        numbers.append(contentsOf: evenNumber)
//        return numbers
//    }
    
    /// 奇数插入数组前面
    /// 偶数添加到数组后面
    func exchange(_ nums: [Int]) -> [Int] {

        var numbers = [Int]()
        
        for num in nums {
                
            if num % 2 == 0 {
                numbers.append(num)
            }else {
                numbers.insert(num, at: 0)
            }
        }
        
        return numbers
    }
}

let numbers = [1,3,5,6,7,8,9,12]
let solution = Solution()
let nums = solution.exchange(numbers)
print(nums)

//: [Next](@next)
