//
//  VTSpacename.swift
//
//
//  Created by ViTo Tse on 2022/11/25.
//

import Foundation

/// 包裹对象，相当于一个命名空间
public struct ViToWrapper<Base> {
    
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
    
}

/// 兼容协议
public protocol ViToCompatible: AnyObject { }
public protocol ViToCompatibleValue { }

/// 实现协议，创建命名空间
extension ViToCompatible {
    
    public var vt: KinShunWarpper<Self> {
        get { return KinShunWarpper(self) }
        set { }
    }
    
}

extension ViToCompatibleValue {
    
    public var vt: KinShunWarpper<Self> {
        get { return KinShunWarpper(self) }
        set { }
    }
    
}

/// 使用例子
/// String 扩展例子
/// String 实现 ViToCompatibleValue
extension String: ViToCompatibleValue {}
/// 在 KinShunWarpper 中扩展 String 的方法
extension ViToWrapper where Base == String {
    
    public var stringFormat: String {
        return "vtFormat"
    }
    
}
