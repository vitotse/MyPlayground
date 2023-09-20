//: [Previous](@previous)

import Foundation

/// 1. TaskLocal
/// TaskLocal 值必须定义为静态的存储属性，并使用 TaskLocal 这个属性包装器（property wrapper）来包装。
///
///

class Logger {
    @TaskLocal
    static var tag: String = "default"
}

/// 或者
//class Logger {
//    @TaskLocal(wrappedValue: "default")
//    static var tag: String
//}

func logWithTag(_ message: Any) async {
    print("(\(Logger.tag)): \(message)")
}

await Logger.$tag.withValue("new MyTask") {
    await logWithTag("in my task")
}

/// 使用默认 Logger
await logWithTag("out of withValue")


/// 2. Task 对于 TaskLocal 的继承
/// Task.detached 隔离了，没有继承

await Logger.$tag.withValue("MyTask2") {
    await Task {
        await logWithTag("Task.init")
    }.value

    await Task.detached {
        await logWithTag("Task.detached")
    }.value
}
//: [Next](@next)
