//: [Previous](@previous)

/// 剑指 Offer 32 - I. 从上到下打印二叉树
/// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/
///
/// 二叉树 层遍历
import Foundation

class Solution {
    func levelOrder(_ root: TreeNode?) -> [Int] {

        var tree = [root]
        var vals = [Int]()
        
        while tree.count > 0 {
            
            if let rootTree = tree.first {
                
                if let left = rootTree?.left {
                    tree.append(left)
                }
                
                if let right = rootTree?.right {
                    tree.append(right)
                }
                
                if let val = rootTree?.val {
                    vals.append(val)
                }
                tree.removeFirst()
                
            }
            
        }
        
        return vals
        
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
