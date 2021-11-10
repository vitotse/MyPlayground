//: [Previous](@previous)

import Foundation

// 剑指 Offer 05. 替换空格

class Solution {
    func replaceSpace(_ s: String) -> String {
        var new = ""
        var unicodeSpace = "%20"
        for c in s {
            if c == " " {
                new.append(unicodeSpace)
            } else {
                new.append(c)
            }
        }
        
        return new
    }
}

let solution = Solution.init()
let newString = solution.replaceSpace("We  are happy.")
print(newString)

//: [Next](@next)
