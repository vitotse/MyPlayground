//: [Previous](@previous)

import Foundation
// map
// 处理数组中每一个元素
var mapArray = [1,2,3]

let mapped = mapArray.map {
     $0 * 2
}

// compactMap
// 筛选走空值
let num: [Int?] = [48, 99, nil]

let compactMap1 = num.compactMap {$0}
//let compactMap2 = num.compactMap { (number) -> Int? in
//
//    if number%9 == 0 {
//        return number
//    }
//
//    return nil
//}

// flatMap，拆包可选型数据组成一个新数组
let array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let arr2 = array.flatMap{ $0 }
arr2


// reduct




//: [Next](@next)
