//: [Previous](@previous)

import Foundation
import Darwin

/// 121. 买卖股票的最佳时机
/// https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/

func maxProfit(_ prices: [Int]) -> Int {
    var min = Int.max
    var max = 0
    
    for price in prices {
        if price < min {
            min = price
        } else if price - min > max {
            max = price - min
        }
    }
    
    return max
}

/// 118. 杨辉三角
/// https://leetcode-cn.com/problems/pascals-triangle/
func generate(_ numRows: Int) -> [[Int]] {

    var result = [[Int]]()
    for level in 1...numRows {
        
        var row = [Int]()

        for index in 1...level {

            if index == 1 || index == level {
                row.append(1)
            } else {
                
                let prelevel = result[level - 2]
                let sum = prelevel[index - 1] + prelevel[index - 2]

                row.append(sum)
            }
            
        }
        result.append(row)
        
    }
    
    return result
}

//generate(30)

//: [Next](@next)
