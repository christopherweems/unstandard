//
//  Transfer.swift
//
//
//  Created by Christopher Weems on 6/8/20.
//  Copyright © 2020 Christopher Weems. All rights reserved.
//

import unstandard

public struct Transfer<Type>: Equatable, ExpressibleByStringLiteral where Type : Equatable {
    public fileprivate(set) var from: Type
    public fileprivate(set) var to: Type
    
    public var isComplete: Bool {
        fatalError()
    }
    
    public func advance() {
        fatalError()
    }
    
    
    // MARK: - Initializers
    
    public init(stringLiteral value: String) {
        self.from = value as! Type
        self.to = "" as! Type
        
    }
    
}


// MARK: -

public extension Transfer where Type == String {
    var isComplete: Bool {
        from.isEmpty
    }
    
    var completeText: String {
        to + from
    }
    
    mutating func advance() {
        let move = from.removeFirst()
        to.append(move)
        
    }
    
    init<SP>(_ string: SP) where SP : StringProtocol {
        self.init(stringLiteral: string.asString())
        
    }
    
}
