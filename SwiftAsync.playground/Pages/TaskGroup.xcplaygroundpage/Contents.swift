import Foundation

//func start() async {
//    print("Start")
//    // 1
//    await withTaskGroup(of: Int.self) { group in
//        for i in 1 ... 3 {
//        // 2
//        group.addTask {
//            await work(i)
//            }
//        }
//        print("Task added")
//        // 4
//        for await result in group {
//            print("Get result: \(result)")
//        }
//        // 5
//        print("Task ended")
//    }
//    print("End")
//}
//
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


/// 使用Async let 代替 Task Group
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

