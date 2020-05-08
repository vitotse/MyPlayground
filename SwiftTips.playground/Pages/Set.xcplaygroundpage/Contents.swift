import UIKit
import PlaygroundSupport

// # Dictionary

// ## sort

var sortDic = ["1":"1abc","2":"2abc","4":"4abc","3":"3abc"]

let result = sortDic.sorted { (arg0, arg1) -> Bool in
    
    let (key1, _) = arg0
    let (key2, _) = arg1

    return key1 > key2
}

let values = result.map({ (arg0) -> String in
    let (_, value) = arg0
        return value
})


extension Dictionary {
    mutating func swap(key1: Key, key2: Key) {
        if  let value = self[key1], let existingValue = self[key2] {
            self[key1] = existingValue
            self[key2] = value
        }

    }
}

sortDic.swap(key1: "1", key2: "3")
print(sortDic)


// ## merge

private protocol Mergable {
    func mergeWithSame<T>(right: T) -> T?

}

extension Array: Mergable {

    func mergeWithSame<T>(right: T) -> T? {

        if let right = right as? Array {
            return (self + right) as? T
        }

        return nil
    }
}


extension Dictionary: Mergable {
    
    func mergeWithSame<T>(right: T) -> T? {

        if let right = right as? Dictionary {
            return self.mergeWithSame(right: right as! T)
        }

        print("----")
        return nil
    }
}


extension Set: Mergable {

    func mergeWithSame<T>(right: T) -> T? {

        if let right = right as? Set {
            return self.union(right) as? T
        }

        return nil
    }
}

let leftDic: [String : Any] = ["a" : "aa1",
               "b" : ["bb" : "b123"],"c" : 123]
let rightDic: [String : Any] = ["a" : "aa2"]

let mergeDic = leftDic.mergeWithSame(right: rightDic)
print("merge - ")
