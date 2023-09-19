//: [Previous](@previous)

import Foundation

enum TestAsyncError: Error {
    case immedicateError
}

func helloAsync() async -> Int {
    await withCheckedContinuation { continuation in
        DispatchQueue.global().async {
            continuation.resume(returning: Int(arc4random()))
        }
    }
}

/// 1. Task init
/// Top-level：顶级任务，没有父类任务
/// on behalf of the current actor
///
/// 使用当前的 Actor 执行环境
Task {
    let result = await helloAsync()
    print(result)
}

/// 2. Task Detached
/// Top-level：顶级任务，没有父类任务
Task.detached (operation: {
    let result = await helloAsync()
    print(result)
})

// 主线程等待 1s，防止程序提前退出导致异步任务没有执行
Thread.sleep(forTimeInterval: 1)


/// 3.Task 的结果
///
/// 数值或者是异常
let task = Task {
    await helloAsync()
}

print(try await task.value)

func errorThrown() async throws {
    throw TestAsyncError.immedicateError
}

func taskWithError() async throws {
    let task = Task {
        try await errorThrown()
    }

    // 避免程序过早退出，等 1s
    await Task.sleep(1000_000_000)
}
/// 捕获错误
//func taskWithError() async throws {
//    let task = Task {
//        try await errorThrown()
//    }
//
//    do {
//        try await task.value
//    } catch {
//        print(error)
//    }
//}

let taskThrown = Task{
    try await taskWithError()
}

print("thrown:\(try await taskThrown)")


//: [Next](@next)
