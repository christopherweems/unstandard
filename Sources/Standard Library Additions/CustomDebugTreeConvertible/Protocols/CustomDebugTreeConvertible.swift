//  CustomDebugTreeConvertible.swift
//  9/11/21

public protocol CustomDebugTreeConvertible {
    associatedtype Subnodes: Collection where Subnodes.Element : CustomDebugTreeConvertible
    var conciseDebugDescription: String { get }
    var debugTreeSubnodes: Subnodes { get }
    
}

extension CustomDebugTreeConvertible where Self : CustomDebugStringConvertible {
    public var conciseDebugDescription: String {
        self.debugDescription
    }
    
}

extension CustomDebugTreeConvertible {
    public var conciseDebugDescription: String {
        String(reflecting: self)
    }
    
}
