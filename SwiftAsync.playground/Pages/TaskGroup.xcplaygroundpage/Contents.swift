import Foundation

enum TestAsyncError: Error {
    case immedicateError
}

/// 多个 Task 的管理
///
/// 1. 使用withTaskGroup 对多个 task 管理
/// 2. addTask，对 task 设置优先级
/// 3. 只关心子 Task 是否执行完，可以调用 TaskGroup 的 waitForAll 函数
/// 4. 可以使用 group.next 获取下一个子任务。要注意的是，这里是子任务的完成顺序，不是加入的顺序

func start() async {
    print("Start")
    // 1
    await withTaskGroup(of: Int.self) { group in
        for i in 1 ... 3 {
        // 2
        group.addTask {
            await work(i)
            }
        }
        print("Task added")
        // 4
        for await result in group {
            print("Get result: \(result)")
        }
        // 5
        print("Task ended")
        
        
    }
    print("End")
}

private func work(_ value: Int) async -> Int {
    // 3
    print("Start work \(value)")
    await Task.sleep(UInt64(value) * NSEC_PER_SEC)
    print("Work \(value) done")
    return value
}
//
//Task {
//    await start()
//}

// =====
//print("=================")
//
//let v: Int = await withTaskGroup(of: Int.self) { group in
//    var value = 0
//    for i in 0 ..< 3 {
//        group.addTask {
////            value += i // addTask 中不能对 value 操作
//            return await work(i)
//        }
//    }
//
//    for await result in group {
//        value += result
//    }
//    return value
//}
//
//print("v:\(v)")

/// 2. 抛出异常的 Group
///
/// ThrowingTaskGroup 与 TaskGroup 的本质是一致的。
/// ThrowingTaskGroup所有成员函数都可以增加 Thrown 关键字

do {
    _ = try await withThrowingTaskGroup(of: Int.self) { group -> String in
        try await Task.sleep(nanoseconds: 1000000)
        return "OK"
    }
} catch {
    
}

/// 3.子任务异常处理

func errorThrown() throws {
    
    throw TestAsyncError.immedicateError
}

let exceptionResult = await withThrowingTaskGroup(of: Int.self) { group -> Int in
    group.addTask {
        await Task.sleep(500_000_000)
        return -1
    }

    group.addTask {
        await Task.sleep(1000_000_000)
        try await errorThrown()
        return 0
    }

    group.addTask {
        await Task.sleep(1500_000_000)
        return 1
    }

    while(!group.isEmpty) {
        do {
            print("exception")
            print(try await group.next() ?? "Nil")
        } catch {
            print("exception error")
            print(error)
        }
    }

    return 100
}

print("exception:\(exceptionResult)")


/// 4. 不要把 TaskGroup 实例传到外面
///
/// 外部调用会报错
///
//var taskGroup: TaskGroup<Int>?
//_ = await withTaskGroup(of: Int.self) { (group) -> Int in
//    taskGroup = group
//    group.addTask { 1 }
//    return 0
//}
//
//guard let group = taskGroup else {
//    print("group is nil")
//    return
//}
//
//for await i in group {
//    print(i)
//}

/// 5. 不要在 子任务里修改 TaskGroup
//await withTaskGroup(of: Void.self) { (group) -> Void in
//    group.addTask {
//        group.addTask { // error!
//            print("inner task")
//        }
//    }
//}


/// 6. 使用Async let 代替 Task Group
//func startWithAsyncLet() async {
//    print("Start")
//    async let v0 = work(0)
//    async let v1 = work(1)
//    async let v2 = work(2)
//    print("Task added")
//    let result = await v0 + v1 + v2
//    print("Task ended")
//    print("End. Result: \(result)")
//}
//
//await startWithAsyncLet()

/// 组合
func startWithTaskGroups() async {
    // 第一层任务组
    await withTaskGroup(of: Int.self) { group in
        group.addTask {
            // 第二层任务组
            await withTaskGroup(of: Int.self) { innerGroup in
                innerGroup.addTask {
                    await work(0)
                }
                innerGroup.addTask {
                    await work(2)
                }
                return await innerGroup.reduce(0) {
                    result, value in
                    result + value
                }
            }
        }
        group.addTask {
            await work(1)
        }
    }
    print("End")
}

await startWithTaskGroups()

