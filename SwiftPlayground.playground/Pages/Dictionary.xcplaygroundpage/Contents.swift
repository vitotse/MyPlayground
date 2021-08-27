//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)


var params = [1:"1", 2: "2"]
var params2 = [3:"3", 2: "4"]


print(params)

params.merge(params2) { key1, key2 in
    return key2
}


print(params)


func curryMergeDict(baseParams:[String:Any]) -> (_ addParams:[String : Any]) -> [String : Any] {
    
    return  { addParams in
        var param : [String : Any] = baseParams
        param = baseParams.merging(addParams) { (current, new) -> Any in

            return new
        }
        
        return param
    }
}

var StringParams = ["1":"1", "2": "2"]
var StringParams2 = ["3":"3", "2": "2"]
var StringParams3 = ["5":"5", "2": "2"]


let curryDict = curryMergeDict(baseParams: StringParams)
let newStringDict = curryDict(StringParams2)
print(newStringDict)

let newStringDict2 = curryDict(StringParams3)
print(newStringDict2)


