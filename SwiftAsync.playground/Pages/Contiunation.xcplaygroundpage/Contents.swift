//: [Previous](@previous)

import Foundation


/// 1. 继续运行
/// - Returns:
func helloAsync() async -> Int {
    await withCheckedContinuation { continuation in
        DispatchQueue.global().async {
            continuation.resume(returning: Int(arc4random()))
        }
    }
}


//let hello = await helloAsync()
//print(hello)


/// 2. 抛出异常续体
/// - Throws: 抛出错误
/// - Returns: 返回数值
func helloAsyncThrows() async throws -> Int {
    try await withCheckedThrowingContinuation { continuation in
        DispatchQueue.global().async {
            do {
                let result = try helloThrows(false) // 可能抛异常
                continuation.resume(returning: result)
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
}

enum TestAsyncError: Error {
    case immedicateError
}


/// 立刻抛出错误
/// - Parameter isThrow: 是否抛出错误
/// - Throws: 抛出错误
/// - Returns: 返回1
func helloThrows(_ isThrow: Bool = true) throws -> Int {
    
    guard isThrow else {
        throw TestAsyncError.immedicateError

    }
    
    return 1
    
}

let helloThrows = await helloAsyncThrows()
print(helloThrows)

//: [Next](@next)
