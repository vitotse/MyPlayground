import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

/// 声明类型
/// 声明属性名
/// 如：#constant(tip)
/// public static var tip
public struct ConstantMacro: DeclarationMacro {
    public static func expansion<Node, Context>(of node: Node, in context: Context) throws -> [DeclSyntax] where Node : FreestandingMacroExpansionSyntax, Context : MacroExpansionContext {
        guard
            let name = node.argumentList.first?
                .expression
                .as(StringLiteralExprSyntax.self)?
                .segments
                .first?
                .as(StringSegmentSyntax.self)?
                .content.text
        else {
            fatalError("compiler bug: invalid arguments")
        }
        
        let camelName = name.split(separator: "_")
            .map { String($0) }
            .enumerated()
            .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
            .joined()
        
        return ["public static var \(raw: camelName) = \(literal: name)"]
    }
}

@main
struct VTMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        ConstantMacro.self,
    ]
}
