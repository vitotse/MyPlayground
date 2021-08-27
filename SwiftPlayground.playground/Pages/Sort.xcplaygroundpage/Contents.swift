//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var array: [String] = ["1", "3", "2"]


array.sort { char1, char2 in
    
    return Int.init(char1) ?? 0 < Int.init(char2) ?? 0
    
}

print(array)
