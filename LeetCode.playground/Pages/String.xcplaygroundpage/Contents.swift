//: [Previous](@previous)

import Foundation

/// 387. 字符串中的第一个唯一字符
/// https://leetcode-cn.com/problems/first-unique-character-in-a-string/

func firstUniqChar(_ s: String) -> Int {
    var map = [Character: Int]()
    for char in s {
        if map[char] == nil {
            map[char] = 1
        } else {
            let count = map[char]!
            map[char] = count + 1
        }
    }
    
    for (index,char) in s.enumerated() {
        if map[char] == 1 {
            return index
        }
    }
   
    
    return -1
}

let index = firstUniqChar("loveove")

/// 383. 赎金信
/// https://leetcode-cn.com/problems/ransom-note/
///
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    
    var temp = magazine
    for char in ransomNote {
        
        if let index = temp.firstIndex(of: char) {
            temp.remove(at: index)
        } else {
            return false
        }
    }
    
    return true
}

canConstruct("aab", "aacv")

//: [Next](@next)

/// 242. 有效的字母异位词
/// https://leetcode-cn.com/problems/valid-anagram/
func isAnagram(_ s: String, _ t: String) -> Bool {

    var map = [Character: Int]()
    
    for char in s {
        if map[char] == nil {
            map[char] = 1
        } else {
            
            let count: Int = map[char]!
            map[char] = count + 1
            
        }
    }
    
    for char in t {
        if map[char] == nil {
            return false
        } else {
            
            var count = map[char]!
            count -= 1
            map[char] = count

            if count == 0 {
                map.removeValue(forKey: char)
            }
            
        }
    }
    
    return map.keys.count == 0
}


isAnagram("this", "his")

/// 125. 验证回文串
///  https://leetcode-cn.com/problems/valid-palindrome/
func isPalindrome(_ s: String) -> Bool {
    
    var left = 0
    var right = s.count - 1
    
    while left < right {
        
        let leftString = s[s.index(s.startIndex, offsetBy: left)]
        let rightString = s[s.index(s.startIndex, offsetBy: right)]

        if leftString.isNumber == false && leftString.isLetter == false {
            left += 1

        }else if rightString.isNumber == false && rightString.isLetter == false {
            right -= 1

        } else {
            if leftString.lowercased() != rightString.lowercased() {
                return false
            }
            
            left += 1
            right -= 1
        }
                    
    }
    
    return true
    
}


isPalindrome("A man, a plan, a canal: Panama")
