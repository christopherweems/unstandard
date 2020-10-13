//
//  ExpressibleByBoolLiteral+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/21/20.
//

import Foundation

public extension ExpressibleByBooleanLiteral {
    static func all(_ value: Bool, @SingleResult _ builder: () -> Bool) -> Bool {
        [builder()].allSatisfy { $0 == value }
    }
    
    static func all(_ value: Bool, @SingleResult _ builder: () -> [Bool]) -> Bool {
        builder().allSatisfy { $0 == value }
    }
    
}

public extension ExpressibleByBooleanLiteral {
    static func any(_ value: Bool, @SingleResult _ builder: () -> Bool) -> Bool {
        builder() == value
    }
    
    static func any(_ value: Bool, @SingleResult _ builder: () -> [Bool]) -> Bool {
        builder().contains { $0 == value }
    }
    
}
