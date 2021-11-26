//: [Previous](@previous)

/// 剑指 Offer 28. 对称的二叉树
/// https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/
import Foundation


class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {

        return checkSymmetric(left: root?.left, right: root?.right)
        
    }
    
    func checkSymmetric(left: TreeNode?, right: TreeNode?) -> Bool {
        
        if left == nil && right == nil {
            return true
        }
        
        if left == nil || right == nil {
            return false
        }
        
        return left?.val == right?.val && checkSymmetric(left: left?.left, right: right?.right) && checkSymmetric(left: left?.right, right: right?.left)
    }
}

let root = TreeNode.init(1)
let left1Node = TreeNode.init(2)
let right1Node = TreeNode.init(2)

let leftLeft1Node = TreeNode.init(3)
let leftRight1Node = TreeNode.init(4)

let rightLeft1Node = TreeNode.init(4)
let rightRight1Node = TreeNode.init(3)

root.left = left1Node
root.right = right1Node

left1Node.left = leftLeft1Node
left1Node.right = leftRight1Node

right1Node.left = rightLeft1Node
right1Node.right = rightRight1Node


let solution = Solution.init()
let symmetric = solution.isSymmetric(root)
//: [Next](@next)
