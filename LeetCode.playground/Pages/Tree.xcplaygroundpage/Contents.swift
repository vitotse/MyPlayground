//: [Previous](@previous)


/// # binary tree
///
/// ## 递归遍历

/// 前序遍历
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var list = [Int]()
    preTraversal(root, list: &list)
    return list
}

func preTraversal(_ root: TreeNode?, list:inout [Int]) {
    
    if root == nil {return}
    
    list.append(root!.val)
    
    preTraversal(root?.left, list: &list)
    preTraversal(root?.right, list: &list)

}

/// 中序遍历
/// https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var list = [Int]()
    inTraversal(root, list: &list)
    return list
}


func inTraversal(_ root: TreeNode?, list:inout [Int]) {
    
    if root == nil {return}
    
    inTraversal(root?.left, list: &list)
    list.append(root!.val)
    inTraversal(root?.right, list: &list)

}

/// 后序遍历
/// https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    
    var list = [Int]()
    posTraversal(root, list: &list)
    return list
}


func posTraversal(_ root: TreeNode?, list:inout [Int]) {
    
    if root == nil {return}
    
    posTraversal(root?.left, list: &list)
    posTraversal(root?.right, list: &list)
    list.append(root!.val)

}

let treeRoot = TreeNode.init(1)
let tree2 = TreeNode.init(2)
let tree21 = TreeNode.init(3)
let tree22 = TreeNode.init(4)

treeRoot.right = tree2
tree2.left = tree21
tree2.right = tree22

preorderTraversal(treeRoot)
postorderTraversal(treeRoot)
inorderTraversal(treeRoot)


/// 前序迭代
func preorderTraversalIteration(_ root: TreeNode?) -> [Int] {
    
    var list = [Int]()
    var trees = [TreeNode]()
    guard let root = root else {
        return []
    }
    
    trees.append(root)
    
    while trees.isEmpty == false {
        
        if let node: TreeNode = trees.popLast() {
            list.append(node.val)
            if let right = node.right {
                trees.append(right)
            }
            
            if let left = node.left {
                trees.append(left)
            }
        } else {
            break
        }
        
    }
    
    return list
    
}

preorderTraversalIteration(treeRoot)

/// https://leetcode-cn.com/problems/binary-tree-right-side-view/
/// 右视图
func rightSideView(_ root: TreeNode?) -> [Int] {
    
    var result = [Int]()
    
    if root == nil {
        return result
    }
    var trees: [TreeNode] = [root!]
    
    while trees.count > 0 {
        
        var values = [Int]()
        var subTress = [TreeNode]()
        
        for node in trees {
            values.append(node.val)
            
            if let left = node.left {
                subTress.append(left)
            }
            
            if let right = node.right {
                subTress.append(right)
            }
            
        }
        trees = subTress
        
        result.append(values.last!)
        
    }
    
    return result
    
}

rightSideView(treeRoot)

/// 637. 二叉树的层平均值
/// https://leetcode-cn.com/problems/average-of-levels-in-binary-tree/
func averageOfLevels(_ root: TreeNode?) -> [Double] {

    var result = [Double]()
    
    if root == nil {
        return result
    }
    var trees: [TreeNode] = [root!]

    
    while trees.count > 0 {
        
        var sum: Int = 0
        var subTress = [TreeNode]()
        
        for node in trees {
            
            sum += node.val
            
            if let left = node.left {
                subTress.append(left)
            }
            
            if let right = node.right {
                subTress.append(right)
            }
            
        }
        
        result.append(Double(Double(sum) / Double(trees.count)))
        trees = subTress

    }
    
    return result
}

averageOfLevels(treeRoot)
 
/// 429. N 叉树的层序遍历
/// https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/
class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        var result = [[Int]]()
        
        if root == nil {
            return result
        }
        var trees: [Node] = [root!]
        
        while trees.count > 0 {
            
            var values = [Int]()
            var subNodes = [Node]()
            
            for node in trees {
                values.append(node.val)
                
                subNodes.append(contentsOf: node.children)
            }
            trees = subNodes
               
            result.append(values)
        }
        
        return result
    }
}

//: [Next](@next)
