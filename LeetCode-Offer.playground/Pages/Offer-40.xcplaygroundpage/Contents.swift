//: [Previous](@previous)
/// 剑指 Offer 40. 最小的k个数
/// https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/
import Foundation

class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {

        var minNums = [Int]()
        
        for num in arr {
                
            minNums.append(num)
            
            if minNums.count > k {
                var maxNum: Int = 0
                
                for mins in minNums {
                    
                    if maxNum < mins {
                        maxNum = mins
                    }
                    
                }
                minNums.remove(at: maxNum)

                
            }
                
        }
        
        return minNums
        
    }
}

let solution = Solution()
solution.getLeastNumbers([0,1,2,2,1,3,5,2], 3)
//: [Next](@next)
