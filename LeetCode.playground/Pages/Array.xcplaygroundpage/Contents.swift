//: Array |
//: [String](String) |
//: [Tree](Tree)

// 过滤重复的元素

func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    if nums.count == 0 {
        return 0
    }
    var j = 0
    for i in 0 ..< nums.count {
        if nums[i] != nums[j] {
            j += 1
            nums[j] = nums[i]
            
        }
    }
    
    return j + 1
    
}

var removeDuplicatesArray:[Int] = [1,2]
removeDuplicates(&removeDuplicatesArray)

//:##找出只有一個的数字
//:给定一个整数数组，除了某个元素外其余元素均出现两次。请找出这个只出现一次的元素。
//: [找出只有一個的数字](https://leetcode-cn.com/explore/interview/card/top-interview-questions-easy/1/array/25/)

func singleNumber(_ nums: [Int]) -> Int {
    
    guard nums.count > 1 else {
        return nums.first!
    }
    
    var nums = nums
    var res = nums.first!
    
    for i in 1..<nums.count {
        //相同的数字去翻等于0
        
        res = res ^ nums[i]
        
    }
    
    return res
}


var singleArray:[Int] = [1,1,2,3,3]
//var singleArray:[Int] = [1]
//var singleArray:[Int] = [1,3,1,-1,3]

singleNumber(singleArray)

/// https://leetcode-cn.com/problems/remove-element/
///
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums.removeAll { num in
        return num == val
    }
    
    return nums.count
}

var removeElementArray = [0,1,2,3,4,5,3,2,3,3,2]

removeElement(&removeElementArray, 3)


/// 88. 合并两个有序数组
/// https://leetcode-cn.com/problems/merge-sorted-array/
/// 双指针
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

    var i = 0
    var j = 0
    var temp = [Int]()
    while i < m || j < n {
        
        if i == m {
            temp.append(nums2[j])
            j += 1
        } else if j == n {
            temp.append(nums1[i])
            i += 1
        } else if nums1[i] < nums2[j] {
            temp.append(nums1[i])
            i += 1
        } else {
            temp.append(nums2[j])
            j += 1
        }
        
    }
    nums1 = temp

}

var num1 = [1,2,3,4]
merge(&num1, 4, [2,4,6,7], 4)


/// 350. 两个数组的交集 II
/// https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result = [Int]()
    
    var map = [Int: Int]()
    
    for num1 in nums1 {
        if let count = map[num1] {
            
            map[num1] = count + 1
        } else {
            map[num1] = 1

        }
    }
    
    for num2 in nums2 {
        if let count = map[num2], count > 0 {
            
            map[num2] = count - 1
            result.append(num2)
            
        }
    }
    
    return result
    
}

var intersectNum1 = [1,2]
var intersectNum2 = [2,1]

intersect(intersectNum1, intersectNum2)

/// 566. 重塑矩阵
/// https://leetcode-cn.com/problems/reshape-the-matrix/
func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    let m = mat.count
    let n = mat.first!.count

    if m * n != r * c {
        return mat
    }
    
    var result = [[Int]]()
    
    for _ in 0..<r {
        result.append([Int]())
    }
    
    for index in 0..<(m*n) {

        if var rows = result[index / c] as? [Int] {
            let matNumber = mat[index / n][index % n]
            rows.append(matNumber)
            
            result[index / c] = rows

        }

    }
    
    return result
    
}

matrixReshape([[1, 2], [3, 4]], 1, 4)

/// 283. 移动零
/// https://leetcode-cn.com/problems/move-zeroes/
func moveZeroes(_ nums: inout [Int]) {

    guard nums.count > 0 else {
        return
    }
    
    var index = 0
    var last = nums.count - 1
    
    while index != last {
        
        if nums[index] == 0 {
            
            nums.append(0)
            nums.remove(at: index)
            
            last -= 1
        } else {
            index += 1

        }
        
    }
    
}

var includeZeroes = [0,1,0,3,12]

moveZeroes(&includeZeroes)

