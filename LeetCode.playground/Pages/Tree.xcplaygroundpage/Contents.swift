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

/// 222. 完全二叉树的节点个数
/// https://leetcode-cn.com/problems/count-complete-tree-nodes/
/// 递归
func countNodes(_ root: TreeNode?) -> Int {
        
    guard let root = root else {
        return 0
    }
    
    let sum = countNodes(root.left) + countNodes(root.right) + 1
    
    return sum
    
}

/// 110. 平衡二叉树
/// https://leetcode-cn.com/problems/balanced-binary-tree/
/// 左右子树的层数跨度大于1，就不是平衡二叉树
func isBalanced(_ root: TreeNode?) -> Bool {

    guard let root = root else {
        return true
    }
    
    let result = getBalanceTreeDepth(root)
    
    if result == -1 {
        return false
    } else {
        return true
    }
    
}

func getBalanceTreeDepth(_ root: TreeNode?) -> Int {
    
    if root == nil {
        return 0
    }
    
    let leftDepth = getBalanceTreeDepth(root?.left)
    let rightDepth = getBalanceTreeDepth(root?.right)
    
    if leftDepth == -1 {
        return -1
    }
    
    if rightDepth == -1 {
        return -1
    }
    /// 左右子树跨度  >  1 返回 -1
    return abs(leftDepth - rightDepth) > 1 ? -1 : 1 + max(leftDepth, rightDepth)
    
}


/// 112. 路径总和
/// https://leetcode-cn.com/problems/path-sum/
func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {

    guard let root = root else {
        return false
    }
        
    return traversal(cur: root, count: targetSum - root.val)
}

func traversal(cur: TreeNode?, count: Int) -> Bool {
    
    if cur?.left == nil && cur?.right == nil && count == 0 {
        return true
    }
    
    if cur?.left == nil && cur?.right == nil {
        return false
    }
    
    
    if cur?.left != nil {
        
        let temp = count - cur!.left!.val
        if traversal(cur: cur?.left, count: temp) {
            return true
        }
    }
    
    if cur?.right != nil {
        
        let temp = count - cur!.right!.val
        if traversal(cur: cur?.right, count: temp) {
            return true
        }
    }
    
    return false

}

/// 700. 二叉搜索树中的搜索
/// https://leetcode-cn.com/problems/search-in-a-binary-search-tree/
/// 递归解法
func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {

    if root == nil || root?.val == val {
        return root
    }
    
    if root!.val > val {
        return searchBST(root?.left, val)
    }
    
    if root!.val < val {
        return searchBST(root?.right, val)
    }
    
    return nil
}

/// 迭代解法
func searchBST_D(_ root: TreeNode?, _ val: Int) -> TreeNode? {

    var head = root
    while head != nil {
        if head!.val > val {
            head = head?.left
        } else if head!.val < val {
            head = head?.right
        } else {
            return head
        }
        
    }
    
    return nil
}

let bst1 = TreeNode.init(1)
let bst2 = TreeNode.init(2)
let bst3 = TreeNode.init(3)
let bst4 = TreeNode.init(4)
let bst7 = TreeNode.init(7)
bst4.left = bst2
bst2.left = bst1
bst2.right = bst3
bst4.right = bst7

let searchNode = searchBST(bst4, 5)


/// 701. 二叉搜索树中的插入操作
/// https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/
func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    
    if root == nil {
        return TreeNode.init(val)
    }
    
    if root!.val > val {
        root?.left = insertIntoBST(root?.left, val)
    }
    
    if root!.val < val {
        root?.right = insertIntoBST(root?.right, val)
    }
    
    return root
}

let insertBST = insertIntoBST(bst4, 5)

/// 98. 验证二叉搜索树
/// https://leetcode-cn.com/problems/validate-binary-search-tree/

var preBSTTree: TreeNode?
func isValidBST(_ root: TreeNode?) -> Bool {
    
    if root == nil {
        return true
    }
    
    let left = isValidBST(root?.left)
    
    if preBSTTree != nil, preBSTTree!.val >= root!.val {
        return false
    }
    preBSTTree = root
    
    let right = isValidBST(root?.right)

    return left && right
}


/// 653. 两数之和 IV - 输入 BST
/// https://leetcode-cn.com/problems/two-sum-iv-input-is-a-bst/
/// 遍历成数组
var result = [Int]()
func BSTinorder(root: TreeNode?) {
    
    if  root == nil {
        return
    }
    
    BSTinorder(root: root!.left)
    result.append(root!.val)
    BSTinorder(root: root!.right)
}

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    BSTinorder(root: root)
    print("resutl:\(result)")
    var leftIndex = 0
    var rightIndex = result.count - 1
    
    while leftIndex < rightIndex {
        
        let sum = result[leftIndex] + result[rightIndex]
        
        if sum > k {
            rightIndex -= 1
        } else if sum < k {
            leftIndex += 1
            
        } else {
            return true
        }
        
        if leftIndex < 0 || rightIndex >= result.count {
            return false
            
        }
        
    }
    
    return false
}

let findSumWithBTS1 = TreeNode.init(1)
let findSumWithBTS2 = TreeNode.init(0)
let findSumWithBTS3 = TreeNode.init(4)
let findSumWithBTS4 = TreeNode.init(-2)
let findSumWithBTS5 = TreeNode.init(3)

findSumWithBTS1.left = findSumWithBTS2
findSumWithBTS1.right = findSumWithBTS3

findSumWithBTS2.left = findSumWithBTS4
findSumWithBTS3.left = findSumWithBTS5


findTarget(findSumWithBTS1, 7)

/// 235. 二叉搜索树的最近公共祖先
/// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    return traversalCommonAncestor(root, p, q)
}

func traversalCommonAncestor(_ cur: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    if cur == nil { return cur }
    
    if cur!.val > p?.val ?? 0 && cur!.val > q?.val ?? 0 {
        
        let left = traversalCommonAncestor(cur?.left, p, q)
        
        if left != nil {
            return left
        }
        
    }
    
    if cur!.val < p?.val ?? 0 && cur!.val < q?.val ?? 0 {
        
        let right = traversalCommonAncestor(cur?.right, p, q)
        
        if right != nil {
            return right
        }
        
    }
    
    return cur
}

/// 257. ⼆叉树的所有路径
/// 题⽬地址：https://leetcode-cn.com/problems/binary-tree-paths/
class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {

    }
}
