//
//  Transfer.swift
//
//
//  Created by Christopher Weems on 6/8/20.
//  Copyright © 2020 Christopher Weems. All rights reserved.
//

import unstandard

public struct Transfer<Type>: Equatable where Type : Equatable {
    public fileprivate(set) var from: Type
    public fileprivate(set) var to: Type
    
    public var isComplete: Bool {
        fatalError("`isComplete` is undefined, implement in an extension on Transfer where Type == \(Type.self)")
    }
    
    public mutating func advance() {
        fatalError("`advance()` is undefined, implement in an extension on Transfer where Type == \(Type.self)")
    }
    
}


// MARK: -

extension Transfer: ExpressibleByStringLiteral, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByUnicodeScalarLiteral where Type == String {
    public typealias ExtendedGraphemeClusterLiteralType = Type.ExtendedGraphemeClusterLiteralType
    public typealias UnicodeScalarLiteralType = Type.UnicodeScalarLiteralType
    
    /// TODO: This describes a transfer from a suffix `from` to a prefix `to`
    /// This is likely opposite to what one comming across this type would expect
    /// Consider adding a direction property to `Transfer`
    
    public var isComplete: Bool {
        from.isEmpty
    }
    
    public var completeText: String {
        to + from
    }
    
    public mutating func advance() {
        let move = from.removeFirst()
        to.append(move)
        
    }
    
    public init<SP>(_ string: SP) where SP : StringProtocol {
        self.init(stringLiteral: string.asString())
        
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.from = .init(stringLiteral: value)
        self.to = .init(stringLiteral: StringLiteralType.init())
        
    }
    
}
