//: [Previous](@previous)

import Foundation
import UIKit
import TestMyMacro

/// @freestanding(expression)
/// 表达式，指的是一段可执行且有返回值的代码
//var downloadedImage: UIImage?
//
//guard let image1 = downloadedImage else {
//    preconditionFailure("Unexpectedly found nil: downloadedImage was already checked")
//}
//
//@freestanding(expression)
//macro unwrap<Wrapped>(_ expr: Wrapped?, message: String) -> Wrapped
//
//let image2 = #unwrap(downloadedImage, message: "was already checked")
//
//
//@freestanding(expression)
//macro file<T>() -> T where T : ExpressibleByStringLiteral

@freestanding(expression)
public macro stringify(_ value: Int) -> (Int, String)
let testString = #stringify(1)


/// @freestanding(declaration)


//: [Next](@next)
