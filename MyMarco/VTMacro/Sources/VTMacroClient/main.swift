import VTMacro

let a = 17
let b = 25

let (result, code) = #stringify(a + b)

print("The value \(result) was produced by the code \"\(code)\"")

struct Constaints {
    
    #constant("error_tip")
//    public static var errorTip = "error_tip"
//    func errorTip() -> String {
//        return "error"
//    }
}

//let constaints = Constaints().
print(Constaints.errorTip)
