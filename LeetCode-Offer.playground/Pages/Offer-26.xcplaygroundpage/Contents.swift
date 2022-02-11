//: [Previous](@previous)

import Foundation

/// 剑指 Offer 26. 树的子结构
/// https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
class Solution {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {

        guard let A = A, let B = B else {
            return false
        }
        
        var root = [A]
        
        while root.count > 0 {
            
            let node = root.first!
            if node.val == B.val {
                
                if equalTreeNode(node.left, B.left) && equalTreeNode(node.right, B.right) {
                    return true
                }
                
            }
            
            if let left = node.left {
                root.append(left)
            }
            
            if let right = node.right {
                root.append(right)
            }
            
            root.remove(at: 0)
        }

        return false
    }
    
    func equalTreeNode(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        
        if B == nil { return true }
        if A == nil {return false}
        
        if let A = A, let B = B {
            if A.val != B.val {
                return false
            }
        }
            
        return equalTreeNode(A!.left, B!.left) && equalTreeNode(A!.right, B!.right)

    }
}

var A = TreeNode.init(10)
var AL = TreeNode.init(12)
var AR = TreeNode.init(6)
var ALL = TreeNode.init(8)
var ALR = TreeNode.init(3)
var ARL = TreeNode.init(11)

A.left = AL
A.right = AR
AL.left = ALL
AL.right = ALR
AR.left = ARL

var B = TreeNode.init(10)
var BL = TreeNode.init(12)
var BR = TreeNode.init(6)
var BLL = TreeNode.init(8)
B.left = BL
B.right = BR
BL.left = BLL

let solution = Solution.init()
let result = solution.isSubStructure(A, B)
print(result)

//: [Next](@next)
