//: [Previous](@previous)

import Foundation

/// Actor

/// 1. Actor 的组成
///     state
///     - actor 存储的数据
///     访问时会有一些限制，避免数据竞争
///
///     mailbox | 邮箱
///     - 等于一个消息队列
///         - 外部对 actor 的可变状态的访问，需要发送一个异步请求到mailbox
///         - actor 的 executor 会串行地执行 mailbox 当中的消息以确保 state 是线程安全的。
///
///     executor | 执行器
///     - 状态修改、访问
///

actor BankAccount {
    let accountNumber: Int
    var balance: Double

    init(accountNumber: Int, initialDeposit: Double) {
        self.accountNumber = accountNumber
        self.balance = initialDeposit
    }
}

/// Usage:
//let account = BankAccount(accountNumber: 1234, initialDeposit: 1000)
//let account2 = account
//print(account === account2) // true


/// 2. Actor 属性隔离
extension BankAccount {
    func deposit(amount: Double) async {
        assert(amount >= 0)
        balance = balance + amount
    }
}

/// 转账
extension BankAccount {
  enum BankError: Error {
    case insufficientFunds
  }

  func transfer(amount: Double, to other: BankAccount) async throws {
    assert(amount > 0)

    if amount > balance {
      throw BankError.insufficientFunds
    }

    balance = balance - amount
    
    // other.balance = other.balance + amount 错误示例
    await other.deposit(amount: amount) // OK
  }
}

/// Usage:
let account = BankAccount(accountNumber: 1234, initialDeposit: 1000)

print(account.accountNumber) // OK，不可变状态(let)
print(await account.balance) // 可变状态(var)访问需要使用 await

await account.deposit(amount: 90) // actor 的函数调用需要 await
print(await account.balance)


/// 3. 在外部修改 actor 的状态
/// isolated 参数只能有一个
func deposit(amount: Double, to account: isolated BankAccount) {
    assert(amount >= 0)
    account.balance = account.balance + amount
}

await deposit(amount: 1000, to: account)
print(await account.balance)

/// 4. 声明不需要隔离的属性和函数（nonisolated）
/// actor 中属性默认隔离
extension BankAccount : CustomStringConvertible {
    nonisolated var description: String {
        "Bank account #\(accountNumber)"
    }
}

print(account.description)

/// 5. Actor 与 @Sendable
/// Actor 协议是实现 Sendable 协议

//: [Next](@next)
