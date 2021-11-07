//: [Previous](@previous)

//Definition for singly-linked list.



// LeetCode 19
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        return head
        
    }
    
    func reseverNode(_ head: ListNode) -> ListNode {
        
        var node: ListNode = head

        var reNode: ListNode!
        repeat {

            node = node.next!

            reNode = ListNode(node.next!.val)
//            reNode.val = node.next!.val
//            reNode.next = ListNode(node.val)
//            reNode = reNode.next!

        }while node.next != nil
        
        return reNode
    }
    
}

//// Usage
//let nodeHead = ListNode.init(1)
//let node1 = ListNode.init(2)
//nodeHead.next = node1
//
//let node2 = ListNode.init(3)
//node1.next = node2
//
//ListNode.showList(head: nodeHead)
//
//let solution = Solution.init()
////solution.removeNthFromEnd(nodeHead,1)
//
//let testNode = solution.reseverNode(nodeHead)
//ListNode.showList(head: nodeHead)


//: [Next](@next)

/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
 */

class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {

        guard let head = head else {
            return nil
        }

        var nextNode: ListNode?
        var reverseNode = ListNode(head.val)
        var temp: ListNode?

        nextNode = head.next
        
        while nextNode != nil {
            temp = ListNode.init(nextNode!.val)
            temp?.next = reverseNode
            reverseNode = temp!
            nextNode = nextNode?.next

        }

        return reverseNode
    }
}

var node2 = ListNode(2)
var node1 = ListNode(1, node2)
var headNode = ListNode(0, node1)

let solution = Solution1()
let reverseNode = solution.reverseList(headNode)


if let node = reverseNode {
    ListNode.showList(head: node)

}
print("123123123123")

