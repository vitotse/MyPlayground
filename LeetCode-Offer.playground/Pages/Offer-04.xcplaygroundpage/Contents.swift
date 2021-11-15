//: [Previous](@previous)
/// 剑指 Offer 04. 二维数组中的查找
import Foundation

class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
                
        for nums in matrix {
            if nums.count == 0 {
                return false
            }
            if nums.first! > target || nums.last! < target {
                continue
            } else {
                
                if nums.contains(target) {
                    return true
                }
                
            }
        }
        return false
    }
}


let matrix = [
    [1,   4,  7, 11, 15],
    [2,   5,  8, 12, 19],
    [3,   6,  9, 16, 22],
    [10, 13, 14, 17, 24],
    [18, 21, 23, 26, 30]]

let solution = Solution()
let missNum = solution.findNumberIn2DArray(matrix, 20)


//: [Next](@next)
