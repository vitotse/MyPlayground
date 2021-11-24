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
