//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

withUnsafeCurrentTask { task in
// 1
    print(task as Any)  // => nil
}
Task {
// 2
    await foo()
}


func foo() async {
    withUnsafeCurrentTask { task in
        // 3
        if let task = task {
            
            // 4
            print("Cancelled: \(task.isCancelled)")
            // => Cancelled: false
            print(task.priority)
            // TaskPriority(rawValue: 33)
        } else {
            print("No task")
        }
    }
}

//: [Next](@next)
