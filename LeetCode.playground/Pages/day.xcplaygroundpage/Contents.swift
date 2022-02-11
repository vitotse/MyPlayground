//: [Previous](@previous)

import Foundation

func countKDifference(_ nums: [Int], _ k: Int) -> Int {
    
    var count = 0
    for (index, num) in nums.enumerated() {
                
        for index1 in index..<nums.count {
            
            let num2 = nums[index1]
            
            if abs(num - num2) == k {
                count += 1
            }
            
        }
    }
    
    return count
    
}

countKDifference([1,2,2,1], 1)

/// 1984. 学生分数的最小差值
/// https://leetcode-cn.com/problems/minimum-difference-between-highest-and-lowest-of-k-scores/
func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
    
    var answer = Int.max
    let sort = nums.sorted { a, b in
        return a > b
    }
    
    var i = 0
    for _ in (i+k-1)..<nums.count {
        answer = min(answer, abs(sort[i + k - 1] - sort[i]))
        i += 1
    }
    
    return answer
}

minimumDifference([90,3,2,4], 2)

//: [Next](@next)
