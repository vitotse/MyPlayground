//: [Previous](@previous)

/**
 * 剑指 Offer 06. 从尾到头打印链表
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */


class Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        
        var nodes: [Int] = [Int]()
        
        var next = head
        
        while next != nil {
            nodes.insert(next!.val, at: 0)
            next = next?.next
        }
        
        return nodes
        
    }
}

let node1 = ListNode.init(1)
let node2 = ListNode.init(2)
let node3 = ListNode.init(3)

node1.next = node2
node2.next = node3

let solution = Solution.init()
let reversePrint = solution.reversePrint(node1)
print(reversePrint)

//: [Next](@next)
