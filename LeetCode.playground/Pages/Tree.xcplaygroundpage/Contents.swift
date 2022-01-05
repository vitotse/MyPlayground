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
 
/// 102. 二叉树的层序遍历
/// https://leetcode-cn.com/problems/binary-tree-level-order-traversal/submissions/
func levelOrder(_ root: TreeNode?) -> [[Int]] {

    var result = [[Int]]()
    
    if root == nil {
        return result
    }
    var trees: [TreeNode] = [root!]
    
    while trees.count > 0 {
        
        var values = [Int]()
        var subNodes = [TreeNode]()
        
        for node in trees {
            values.append(node.val)
            
            if let leftNode = node.left {
                subNodes.append(leftNode)
            }
            if let rightNode = node.right {
                subNodes.append(rightNode)
            }
            
        }
        trees = subNodes
           
        result.append(values)
    }
    
    return result
    
}

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

/// 515. 在每个树行中找最大值
/// https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row/

func largestValues(_ root: TreeNode?) -> [Int] {

    var result = [Int]()
    
    if root == nil {
        return result
    }
    
    var trees: [TreeNode] = [root!]
    
    while trees.count > 0 {
        
        var leaves = [TreeNode]()
        var largestLevelValue: Int?
        for tree in trees {
            
            if largestLevelValue != nil {
                largestLevelValue = max(largestLevelValue!, tree.val)
            } else {
                largestLevelValue = tree.val

            }
            
            if let left = tree.left {
                leaves.append(left)
            }
            
            if let right = tree.right {
                leaves.append(right)
            }
            
        }
        trees = leaves
        
        result.append(largestLevelValue!)
    }
    
    
    return result
}

largestValues(treeRoot)

/// 116. 填充每个节点的下一个右侧节点指针
/// https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node/
/// 117. 填充每个节点的下一个右侧节点指针 II
/// https://leetcode-cn.com/problems/populating-next-right-pointers-in-each-node-ii/submissions/
public class Node1 {
    public var val: Int
    public var left: Node1?
    public var right: Node1?
    public var next: Node1?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func connect(_ root: Node1?) -> Node1? {
    
    var trees: [Node1] = [root!]
    if root == nil {
        return root
    }
    while trees.count > 0 {
        
        var leaves = [Node1]()
        var preNode: Node1?
        for tree in trees {
            
            if preNode != nil {
                preNode!.next = tree
                preNode = preNode!.next
            } else {
                preNode = tree

            }
            
            if let left = tree.left {
                leaves.append(left)
            }
            
            if let right = tree.right {
                leaves.append(right)
            }
            
        }
        
        trees = leaves
        
    }
    
    return root
}

let rootNode1 = Node1.init(1)
let node1_11 = Node1.init(2)
let node1_12 = Node1.init(3)
let node1_21 = Node1.init(4)
let node1_22 = Node1.init(5)
let node1_23 = Node1.init(6)
let node1_24 = Node1.init(7)

rootNode1.left = node1_11
rootNode1.right = node1_12
node1_11.left = node1_21
node1_11.right = node1_22
node1_12.left = node1_23
node1_12.right = node1_24

connect(rootNode1)

/// 226. 翻转二叉树
/// https://leetcode-cn.com/problems/invert-binary-tree/

func invertTree(_ root: TreeNode?) -> TreeNode? {

    if root == nil {
        return root
    }
    
    
    return invertT(root!)
}

func invertT(_ root: TreeNode) -> TreeNode {
    
    let tempNode = root.left
    
    if let right = root.right {
        root.left = invertT(right)
    } else {
        root.left = nil
    }
    if let left = tempNode {
        root.right = invertT(left)
    } else {
        root.right = nil
    }
    
    return root
    
}

invertTree(treeRoot)

/// 101. 对称二叉树
/// https://leetcode-cn.com/problems/symmetric-tree/
func isSymmetric(_ root: TreeNode?) -> Bool {

    if let root = root {
        return compareNode(root.left, root.right)
    }
    
    return true
}

func compareNode(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    
    if left == nil && right != nil {
        return false
    } else if left != nil && right == nil {
        return false
    } else if left == nil && right == nil {
        return true
    } else if left?.val != right?.val {
        return false
    }
    
    let outside = compareNode(left?.left, right?.right)
    let inside = compareNode(left?.right, right?.left)

    return (outside && inside)
    
}


/// 559. N 叉树的最大深度
/// https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/
func maxDepth(_ root: Node?) -> Int {
        
    if root == nil {
       return 0
    }
    
    var leaves = [root!]
    var depth = 0
    while leaves.count > 0 {
        
        var nodes = [Node]()
        for node in leaves {
            
            for child in node.children {
                nodes.append(child)
            }
        }
        
        leaves = nodes
        depth += 1
        
    }
    
    return depth
}

/// 111. 二叉树的最小深度
/// https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/
func minDepth(_ root: TreeNode?) -> Int {

    return getMinDepth(root)
}

func getMinDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    let leftDepth = getMinDepth(root?.left)
    let rightDepth = getMinDepth(root?.right)
    
    if root?.left == nil && root?.right != nil {
        return 1 + rightDepth
    }
    
    if root?.right == nil && root?.left != nil {
        return 1 + leftDepth
    }
    
    let result = 1 + min(leftDepth, rightDepth)
    return result

}
//: [Next](@next)
