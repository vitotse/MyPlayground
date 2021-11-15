//: [Previous](@previous)

import Foundation

/// 剑指 Offer 50. 第一个只出现一次的字符
/// https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/
///

class Solution {
    func firstUniqChar(_ s: String) -> Character {
            
        var mutableString: String = ""
        var uniqString: String = ""
        
        for char in s {
            
            if mutableString.contains(char) {
                continue
            } else {
                
                if uniqString.contains(char) {
                    mutableString.append(char)
                    uniqString = uniqString.replacingOccurrences(of: String(char), with: "")
                }else {
                    
                    uniqString.append(char)
                }
                
            }
            
        }
        
        if let firtUniq = uniqString.first {
            return firtUniq
        } else {
            return " "
        }
        
    }
    
    /// 使用哈希表
    func firstUniqCharWithHash(_ s: String) -> Character {
            
        var charHash: [Character: Bool] = [Character: Bool]()
        
        for char in s {
            
            if charHash[char] != nil {
                charHash[char] = true

            } else {
                charHash[char] = false
            }
        }
        
        for char in s {
            
            if charHash[char] == false {
                return char
            }
            
        }
        
        return " "
        
    }
    
}

let solution = Solution()
let firstUniqChar = solution.firstUniqCharWithHash("abbacdefg")


//: [Next](@next)
