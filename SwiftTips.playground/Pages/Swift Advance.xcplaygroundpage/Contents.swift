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
print(compactMap1)
let compactMap2 = num.compactMap { (number) -> Int? in

    guard number != nil else {
        return nil
    }
    if number!%9 == 0 {
        return number
    }

    return nil
}

// flatMap
// 拆包可选型（optional）数据组成一个新数组
// ps. 只能拆一层,例如，三维数组会变成二维数组
let array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let arr2 = array.flatMap{ $0 }

// reduct

let reduceArray = arr2.reduce(0, +)


//: [Next](@next)
