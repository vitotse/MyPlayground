//: [Previous](@previous)

import Foundation

class AClass {
    
}

struct AStruct {
    
    init() {
        print("i am a struct")
    }
}

public class BClass {
        
    struct BStruct {
        
        public static let name = "b struct"
                    
        
    }
    
}

var bClass = BClass()

print("\(BClass.BStruct.name)")


//: [Next](@next)
