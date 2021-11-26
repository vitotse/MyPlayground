//: [Previous](@previous)

/// 剑指 Offer 58 - I. 翻转单词顺序
/// https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/
import Foundation

class Solution {
    func reverseWords(_ s: String) -> String {

        var reverse = ""
        var word = ""
        for char in s {
            
            if char == " " {
                
                if word.count > 0 {
                    
                    if reverse.count > 0 {
                        reverse = "\(word) \(reverse)"

                    }else {
                        reverse = word
                    }
                }
                
                word = ""
            }else {
                word.append(char)
            }
            
        }
        
        if word.count > 0 {
            if reverse.count > 0 {
                reverse = "\(word) \(reverse)"

            }else {
                reverse = word
            }
            
        }
        
        return reverse
    }
}

let solution = Solution.init()
solution.reverseWords("  I am  Vito ")

//: [Next](@next)
