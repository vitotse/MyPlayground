//: [Previous](@previous)

/// 剑指 Offer 25. 合并两个排序的链表
/// https://leetcode-cn.com/problems/he-bing-liang-ge-pai-xu-de-lian-biao-lcof/
import Foundation

var greeting = "Hello, playground"

class Solution {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        let dummy: ListNode = ListNode()
        var curr: ListNode? = dummy
        
        var head1 = l1
        var head2 = l2
        
        while head1 != nil || head2 != nil {
            
            if head1 == nil {
                curr?.next = head2
                break
            }
            
            if head2 == nil {
                curr?.next = head1
                break
            }
            
            if head1!.val < head2!.val {
                curr!.next = head1
                head1 = head1?.next
                curr = curr?.next
            } else {
                curr!.next = head2
                head2 = head2?.next
                curr = curr?.next
            }
            
            ListNode.showList(head: dummy)

        }
        
        return dummy.next
    }
}


var headNode12 = ListNode(6)
var headNode11 = ListNode(2, headNode12)
var headNode1 = ListNode(1, headNode11)

ListNode.showList(head: headNode1)

var headNode22 = ListNode(3)
var headNode21 = ListNode(1, headNode22)
var headNode2 = ListNode(1, headNode21)

ListNode.showList(head: headNode2)

let solution = Solution()
let mergeNode = solution.mergeTwoLists(headNode1, headNode2)
ListNode.showList(head: mergeNode)

//: [Next](@next)
