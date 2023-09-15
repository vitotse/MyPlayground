//: [Previous](@previous)

import Foundation

[Equatable, Hashable, and Comparable](https://medium.com/nerd-for-tech/equatable-hashable-and-comparable-d782449f6ce8#:~:text=It%20is%20another%20protocol%20that,but%20it%20often%20goes%20unnoticed.)



struct Foo {
    var n: Int = 0
}

extension Foo: Equatable {
    
    static func == (lhs: Foo, rhs: Foo) -> Bool { return rhs.n == lhs.n && rhs.hashValue == lhs.hashValue }

}

extension Foo: Hashable {
    var hashValue: Int { n / 2 }
}

var f1 = Foo()
f1.n = 2

var f2 = Foo()
f2.n = 3

f1.hashValue
f2.hashValue

let f3 = f1

print(f3 == f1)
print(f3 == f2)


extension Foo: Comparable {
    
}


//: [Next](@next)
