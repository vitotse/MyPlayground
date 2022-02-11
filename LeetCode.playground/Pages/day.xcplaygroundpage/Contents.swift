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

//: [Next](@next)
