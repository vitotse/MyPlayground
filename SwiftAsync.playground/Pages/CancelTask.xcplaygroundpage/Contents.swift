//: [Previous](@previous)

import Foundation

/// 1. Task Cancel
/// Cancel 只是标记，不会影响执行
/// 需要内部执行逻辑的响应

//let task = Task {
//    print("task start")
//    await Task.sleep(10_000_000_000)
//    print("task finish, isCancelled: \(Task.isCancelled)")
//}
//
//await Task.sleep(500_000_000)
//task.cancel()
//print(await task.result)

/// 2. Task.sleep
///
/// public static func sleep(_ duration: UInt64) async
/// public static func sleep(nanoseconds duration: UInt64) async throws
///
/// 差别：后者是纳秒，可以抛出异常
///
/// 可以使用抛出 Cancelled 的错误状态

//let taskSleep = Task {
//    print("task sleep start")
//    try await Task.sleep(nanoseconds: 10_000_000_000)
//    print("task sleep finish, isCancelled: \(Task.isCancelled)")
//}
//
//await Task.sleep(500_000_000)
//taskSleep.cancel()
//print(await taskSleep.result)

/// 3. 检查取消的状态
///
/// 使用 checkCancellation
///

/// 手动检查并抛出错误
//let taskCheckCancellationManualThrown = Task {
//    print("task check cancel manual start")
//    for i in 0...10000 {
//        if Task.isCancelled {
//            throw CancellationError()
//        }
//        doHardWork(i)
//    }
//    print("task check cancel manual finish, isCancelled: \(Task.isCancelled)")
//}
//await Task.sleep(500_000_000)
//taskCheckCancellationManualThrown.cancel()
//print(await taskCheckCancellationManualThrown.result)

/// 等价于这段代码
//let taskCheckCancellation = Task {
//    print("task checkCancellation start")
//    for i in 0...10000 {
//        try Task.checkCancellation()
//        doHardWork(i)
//    }
//    print("task checkCancellation finish, isCancelled: \(Task.isCancelled)")
//}
//
//await Task.sleep(1_000)
//taskCheckCancellation.cancel()
//print(await taskCheckCancellation.result)

func doHardWork(_ number: Int) {
        
    print("hard work:\(number)")
}

/// 4. group cancel
///
let max = 10
let taskCount = 10

await withTaskGroup(of: (Int, Int).self) { group -> Void in
    for i in 0..<taskCount {
        group.addTask {
            var count = 0
            while !Task.isCancelled && count < max {
                await Task.sleep(1000_000_000 + UInt64(arc4random_uniform(500_000_000)))
                count += 1

                print("Task: \(i), count: \(count)")
            }
            return (i, count)
        }
    }

    await Task.sleep(5500_000_000)
    group.cancelAll()

    for await result in group {
        print("Task group cancel result: \(result)")
    }
}
//: [Next](@next)
