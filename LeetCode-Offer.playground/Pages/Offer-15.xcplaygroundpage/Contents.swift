//: [Previous](@previous)

import Foundation

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

//: [Next](@next)
