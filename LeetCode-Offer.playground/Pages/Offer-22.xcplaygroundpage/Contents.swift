//: [Previous](@previous)

/// 剑指 Offer 22. 链表中倒数第k个节点
/// https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
import Foundation

class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {

        var front = head
        var behind = head

        var index = k
        
        while front != nil && index > 0 {
            front = front?.next
            index -= 1
        }
        
        while front != nil {
            front = front?.next
            behind = behind?.next

        }
        
        return behind
        
    }
}


let node1 = ListNode.init(1)
let node2 = ListNode.init(2)
let node3 = ListNode.init(3)
let node4 = ListNode.init(4)

node1.next = node2
node2.next = node3
node3.next = node4

let solution = Solution.init()
let end = solution.getKthFromEnd(node1, 2)

print(end?.val)
//: [Next](@next)
