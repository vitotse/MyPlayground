//: [Previous](@previous)

/// 剑指 Offer 58 - II. 左旋转字符串
import Foundation

class Solution {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        
        var num = n
        if n > s.count { num = n % s.count }

        let preString = s.prefix(num)
        let sufString = s.suffix(s.count-num)
        
        return String(sufString) + String(preString)
    }
}

let solution = Solution()
let new = solution.reverseLeftWords("abcdefg", 100)
//: [Next](@next)
