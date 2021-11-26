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
treeRoot.right = tree2
tree2.left = tree21

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

//: [Next](@next)
