//: [Previous](@previous)

/// 剑指 Offer 18. 删除链表的节点
/// https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/

import Foundation

/**
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
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        var node = head
        
        if node?.val == val {
            node = node?.next
            return node
        }
        
        var nextNode = node?.next

        while nextNode != nil {
            
            if nextNode?.val == val {
                node?.next = nextNode?.next
                return head
            }
            
            node = nextNode
            nextNode = nextNode?.next

        }
        
        return node
    }
}

let head = ListNode.init(0)
let node1 = ListNode.init(1)
let node2 = ListNode.init(2)
let node3 = ListNode.init(3)
let node4 = ListNode.init(4)

head.next = node1
node1.next = node2
node2.next = node3
node3.next = node4

let solution = Solution()
let deleteNode = solution.deleteNode(head, 4)

ListNode.showList(head: deleteNode)

//: [Next](@next)
