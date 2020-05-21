//
//  ExpressibleByBoolLiteral+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/21/20.
//

import Foundation

public extension ExpressibleByBooleanLiteral {
    static func all(_ value: Bool, @SingleElementBuilder<Bool> _ builder: () -> Bool) -> Bool {
        [builder()].allSatisfy { $0 == value }
    }
    
    static func all(_ value: Bool, @SimpleArrayBuilder<Bool> _ builder: () -> [Bool]) -> Bool {
        builder().allSatisfy { $0 == value }
    }
    
}
