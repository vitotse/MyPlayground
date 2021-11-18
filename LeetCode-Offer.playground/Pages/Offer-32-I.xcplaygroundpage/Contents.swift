//: [Previous](@previous)

/// 剑指 Offer 32 - I. 从上到下打印二叉树
/// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
import Foundation

class Solution {
    func levelOrder(_ root: TreeNode?) -> [Int] {

        var tree = [Int]()
        
        while root?.val != nil {
            
            tree.append(root?.val!)
            
            if
            
        }
        
        return tree
        
        
    }
}


let root = TreeNode.init(3)
let nodeL1 = TreeNode.init(9)
let nodeR1 = TreeNode.init(20)

let nodeR1L = TreeNode.init(15)
let nodeR1R = TreeNode.init(7)

root.left = nodeL1
root.right = nodeR1
nodeR1.left = nodeR1L
nodeR1.right = nodeR1R

let solution = Solution()
let levelInt = solution.levelOrder(root)

//: [Next](@next)
