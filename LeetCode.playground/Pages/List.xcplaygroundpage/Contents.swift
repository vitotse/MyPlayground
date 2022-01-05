////: [Previous](@previous)
//
////Definition for singly-linked list.
//
//
//
//// LeetCode 19
//class Solution {
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//
//        return head
//
//    }
//
//    func reseverNode(_ head: ListNode) -> ListNode {
//
//        var node: ListNode = head
//
//        var reNode: ListNode!
//        repeat {
//
//            node = node.next!
//
//            reNode = ListNode(node.next!.val)
////            reNode.val = node.next!.val
////            reNode.next = ListNode(node.val)
////            reNode = reNode.next!
//
//        }while node.next != nil
//
//        return reNode
//    }
//
//}
//
////// Usage
////let nodeHead = ListNode.init(1)
////let node1 = ListNode.init(2)
////nodeHead.next = node1
////
////let node2 = ListNode.init(3)
////node1.next = node2
////
////ListNode.showList(head: nodeHead)
////
////let solution = Solution.init()
//////solution.removeNthFromEnd(nodeHead,1)
////
////let testNode = solution.reseverNode(nodeHead)
////ListNode.showList(head: nodeHead)
//
//
////: [Next](@next)
//
///*
// * @lc app=leetcode.cn id=206 lang=swift
// *
// * [206] 反转链表
// */
//
//class Solution1 {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//
//        guard let head = head else {
//            return nil
//        }
//
//        var nextNode: ListNode?
//        var reverseNode = ListNode(head.val)
//        var temp: ListNode?
//
//        nextNode = head.next
//
//        while nextNode != nil {
//            temp = ListNode.init(nextNode!.val)
//            temp?.next = reverseNode
//            reverseNode = temp!
//            nextNode = nextNode?.next
//
//        }
//
//        return reverseNode
//    }
//}
//
//var node2 = ListNode(2)
//var node1 = ListNode(1, node2)
//var headNode = ListNode(0, node1)
//
//let solution = Solution1()
//let reverseNode = solution.reverseList(headNode)
//
//
//if let node = reverseNode {
//    ListNode.showList(head: node)
//
//}
//print("123123123123")
//
/////
///  21
//class Solution21 {
//    func mergeTwoLists(_ l1: inout ListNode?, _ l2: inout ListNode?) -> ListNode? {
//
//        let dummy: ListNode = ListNode.init()
//        var cur = dummy
//
//        while (l1 != nil || l2 != nil) {
//
//            if l1?.val ?? 0 >= head2?.val ?? 0 {
//                cur.next = l1
//                if let next = l1!.next {
//                    l1 = next
//                    print(next.val)
//                }else {
//                    l1 = nil
//                }
//            } else {
//                cur.next = l2
//                if let next = l2!.next {
//                    l2 = next
//                }else {
//                    l2 = nil
//                }
//            }
//
//            if let next = cur.next {
//                cur = next
//            }
//
//        }
//
//        return dummy.next
//    }
//}
//
//var headNode12 = ListNode(6)
//var headNode11 = ListNode(2, headNode12)
//var headNode1 = ListNode(1, headNode11)
//
//ListNode.showList(head: headNode1)
//
//var headNode22 = ListNode(3)
//var headNode21 = ListNode(1, headNode22)
//var headNode2 = ListNode(1, headNode21)
//
//ListNode.showList(head: headNode2)
//
//let solution21 = Solution21()
//let mergeNode = solution21.mergeTwoLists(headNode1, headNode2)


var node1 = ListNode.init(5)
var node10 = ListNode.init(4)
var node100 = ListNode.init(9)

node1.next = node10
node10.next = node100

var node2 = ListNode.init(5)
var node20 = ListNode.init(4)
var node200 = ListNode.init(9)

node2.next = node20
node20.next = node200

///// 2. 两数相加
///// https://leetcode-cn.com/problems/add-two-numbers/
//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//
//    var inNum = 0
//    var newNode: ListNode = ListNode()
//
//    let resultNode = newNode
//
//    var node1: ListNode? = l1
//    var node2: ListNode? = l2
//
//    while node1 != nil || node2 != nil {
//
//        let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + inNum
//
//        inNum = sum / 10
//        newNode.next = ListNode(sum % 10)
//        newNode = newNode.next!
//        node1 = node1?.next
//        node2 = node2?.next
//    }
//
//    if inNum == 1 {
//        newNode.next = ListNode.init(inNum)
//    }
//
//
//    return resultNode.next
//
//}
//
//addTwoNumbers(node1, node2)

/// 203. 移除链表元素
/// https://leetcode-cn.com/problems/remove-linked-list-elements/
///
/// 用递归解题
func removeElements1(_ head: ListNode?, _ val: Int) -> ListNode? {

    if head == nil {
        return nil
    }

    head!.next = removeElements(head!.next, val)
    
    if head!.val == val {
        return head!.next
    } else {
        return head
    }
}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {

    let dummyNode = ListNode()
    dummyNode.next = head
    
    var prevNode = dummyNode
    
    while prevNode.next != nil {
        
        if prevNode.next!.val == val {
            prevNode.next = prevNode.next?.next
        } else {
            prevNode = prevNode.next!
        }
               
    }
    
    return dummyNode.next
}


/// 83. 删除排序链表中的重复元素
/// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
func deleteDuplicates(_ head: ListNode?) -> ListNode? {

    let dumpNode = ListNode.init()
    dumpNode.next = head
    var preNode = dumpNode.next
    
    while preNode?.next != nil {
        
        if preNode?.val == preNode?.next?.val {
            preNode?.next = preNode?.next?.next
        } else {
            preNode = preNode?.next
        }
        
    }
    
    
    return dumpNode.next
    
}

/// 232. 用栈实现队列
/// https://leetcode-cn.com/problems/implement-queue-using-stacks/
class MyQueue {

    var dumpNode: ListNode?
    
    init() {
        dumpNode = ListNode()
    }
    
    func push(_ x: Int) {
        
        var next = dumpNode
        
        while next?.next != nil {
            next = next?.next
        }
        
        next?.next = ListNode.init(x)
    }
    
    func pop() -> Int {
        guard let firstNode = dumpNode?.next  else {
            return -1
        }
        
        dumpNode?.next = firstNode.next
        
        return firstNode.val
    }
    
    func peek() -> Int {
        guard let firstNode = dumpNode?.next  else {
            return -1
        }
        
        return firstNode.val
    }
    
    func empty() -> Bool {
        if dumpNode?.next == nil {
            return true
        } else {
            return false
        }
    }
    
}

let queueNodes = MyQueue()
queueNodes.push(1)
queueNodes.push(2)
queueNodes.pop()
queueNodes.empty()


/// 141. 环形链表
/// https://leetcode-cn.com/problems/linked-list-cycle/
func hasCycle(_ head: ListNode?) -> Bool {
    
    if head == nil || head?.next == nil {
        return false
    }
    var fast = head
    var slow = head
    
    while fast?.next != nil && fast?.next?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if fast === slow {
            return true
        }
    }
    return false
    
}

