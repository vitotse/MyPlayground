// The Swift Programming Language
// https://docs.swift.org/swift-book


//@freestanding(expression)
//    创建一个有返回值的表达式
/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(module: "VTMacroMacros", type: "StringifyMacro")

//@freestanding(declaration)
//    创建一个或多个声明
@freestanding(declaration, names: arbitrary)
public macro constant(_ value: String) = #externalMacro(module: "VTMacroMacros", type: "ConstantMacro")


//@attached(peer)
//    为关联的声明添加一段新的声明
//@attached(accessor)
//    为关联的声明添加存取代码（get、set 等）
//@attached(memberAttribute)
//    为关联的类型或扩展添加新特性
//@attached(member)
//    为关联的类型或扩展添加新的声明
//@attached(conformance)
//    为关联的类型或扩展添加新的协议遵循
