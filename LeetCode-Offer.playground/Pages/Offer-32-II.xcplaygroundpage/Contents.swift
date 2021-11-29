//: [Previous](@previous)

/// 剑指 Offer 32 - II. 从上到下打印二叉树 II
/// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/
import Foundation

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {

        var trees = [[Int]]()
        var stack = [TreeNode]()
        
        if let root = root {
            stack = [root]
        }
        
        while stack.count > 0 {
            
            var values = [Int]()
            var subTree = [TreeNode]()
            for tree in stack {
                values.append(tree.val)
                
                if let left = tree.left {
                    subTree.append(left)
                }
                if let right = tree.right {
                    subTree.append(right)
                }
                
            }
            stack = subTree
            trees.append(values)
        }
        
        return trees
        
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
