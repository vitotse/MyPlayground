//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


var numbers:[Int] = [1,2,3]

numbers.reduce(0) { result, number in
    
    return result + number
}


numbers.map { index in
    return index * 2
}

numbers.flatMap { index in
    return [index, index * 2]
}

numbers.compactMap({ index -> [String] in
    return ["\(index + 1)","\(index * 2)"]
}).flatMap { $0
}
