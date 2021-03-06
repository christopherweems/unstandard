//
//  Bool+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/8/20.
//

import Foundation

public extension Bool {
    static func &=(_ lhs: inout Bool, _ rhs: Bool) {
        lhs = lhs && rhs
    }
    
    static func |=(lhs: inout Bool, rhs: Bool) {
        lhs = lhs || rhs
    }
    
}


// MARK: -

public extension Optional where Wrapped == Bool {
    var isFalse: Bool { self == false }
    var isTrue: Bool { self == true }
    
}

public extension Optional where Wrapped == Bool {
    /// be aware, !(nil) == true
    static prefix func !(_ element: Self) -> Bool {
        element != true
    }
    
    static func ||(_ lhs: Self, rhs: Self) -> Bool {
        lhs == true || rhs == true
    }
    
}

public extension Bool {
    var isTrue: Bool { self == true }
    var isFalse: Bool { self != true }
    
}
