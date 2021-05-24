//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


var numbers:[Int] = [1,2,3]

numbers.reduce(0) { result, number in
    
    return result + number
}
