//: [Previous](@previous)

import Foundation

/// GlobalActor
/// 全局的调度器

/// 1. MainActor
/// 继承 GlobalActor 协议
/// 可以用来修饰属性、函数、闭包、类

/// 这里的异步访问逻辑实际上与 actor 类型的状态和函数的关系相同，即被 @MainActor 修饰的函数内部访问同样被 @MainActor 修饰的属性时则不需要异步执行

class State {
    @MainActor var value: Int = 0
}

@MainActor func calledOnMain() {
    logThread("onMain")
}

func runOnMain(block: @MainActor @escaping () -> Void) async {
    logThread("runOnMain before")
    await block()
    logThread("runOnMain after")
}

@MainActor
class UiState {
    var value: Int = 0

    func update(value: Int) {
        self.value = value
    }
}


/// 2. 自定义 GloablActor
///

@globalActor actor MyActor: GlobalActor {

    // 实现 GlobalActor 协议当中的 associatedtype
    public typealias ActorType = MyActor

    // 实现 GlobalActor 当中的 shared，返回一个全局共享的 MyActor 实例
    static let shared: MyActor = MyActor()

    private static let _sharedExecutor = MyExecutor()

    // 实现 GlobalActor 当中的 sharedUnownedExecutor，返回自己的调度器
    static let sharedUnownedExecutor: UnownedSerialExecutor = _sharedExecutor.asUnownedSerialExecutor()

    // 显示实现 Actor 协议当中的调度器，避免让编译器自动生成
    let unownedExecutor: UnownedSerialExecutor = sharedUnownedExecutor
}

final class MyExecutor : SerialExecutor {

    // 自定义 DispatchQueue，用于真正地调度异步函数
    private static let dispatcher: DispatchQueue = DispatchQueue(label: "MyActor")

    // 需要调度时，Swift 的协程运行时会创建一个 UnownedJob 实例调用 enqueue 进行调度
    func enqueue(_ job: UnownedJob) {
        print("enqueue")
        MyExecutor.dispatcher.async {
            // 执行这个 job
            job._runSynchronously(on: self.asUnownedSerialExecutor())
        }
    }

    // 获取 unowned 引用，得到 UnownedSerialExecutor 实例
    func asUnownedSerialExecutor() -> UnownedSerialExecutor {
        UnownedSerialExecutor(ordinary: self)
    }
}

/// Usage:
//Task { () -> Int in
//    logThread("task start")
//    await calledOnMain()
//    logThread("task end")
//    return 1
//}
//
//Task { () -> Int in
//    logThread("task start")
//    await runOnMain {
//        logThread("on main")
//    }
//    logThread("task end")
//    return 1
//}

func logThread(_ msg: String) {
    print("[\(Thread.current)]:\(msg)")
}

/// 使用 MyActor

func runOnMyExecutor(block: @MyActor @escaping () async -> Void) async {
    logThread("runOnMyExecutor start")
    await block()
    logThread("runOnMyExecutor end")
}

@MyActor func calledOnMyExecutor() {
    logThread("onMyExecutor")
}

/// Usage:
//Task { () -> Int in
//    logThread("task start")
//    await calledOnMyExecutor()
//
//    await runOnMyExecutor {
//        logThread("on MyExecutor before sleep")
//        await Task.sleep(1000_000_000)
//        logThread("on MyExecutor after sleep")
//    }
//    logThread("task end")
//    return 1
//}

/// Task 与 actor 上下文
///
/// [<_NSMainThread: 0x600002984100>{number = 1, name = main}]:task start
/// [<NSThread: 0x6000029b0280>{number = 7, name = (null)}]:runOnMain before
/// [<NSThread: 0x6000029b0280>{number = 7, name = (null)}]:detached task in runOnMain
/// [<NSThread: 0x600002985d40>{number = 4, name = (null)}]:runOnMain after
/// [<_NSMainThread: 0x600002984100>{number = 1, name = main}]:task in runOnMain
/// [<_NSMainThread: 0x600002984100>{number = 1, name = main}]:task end
///
let value = await Task { () -> Int in
    logThread("task start") // main
    
    await runOnMain {
        Task {
            logThread("task in runOnMain") // main
        }

        /// task detached 隔离了
        Task.detached {
            logThread("detached task in runOnMain")
        }
    }
    logThread("task end") // main
    return 1
}.value

print("value:\(value)")

//: [Next](@next)
