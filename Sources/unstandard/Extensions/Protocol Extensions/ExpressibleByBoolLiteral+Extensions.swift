//  ExpressibleByBoolLiteral+Extensions.swift
//  Created by Christopher Weems on 5/21/20

import Foundation

extension ExpressibleByBooleanLiteral {
    public static func all(_ value: Bool, @ArrayBuilder _ builder: () -> [Bool]) -> Bool {
        builder().allSatisfy { $0 == value }
    }
    
}

extension ExpressibleByBooleanLiteral {
    public static func any(_ value: Bool, @ArrayBuilder _ builder: () -> [Bool]) -> Bool {
        builder().contains { $0 == value }
    }
    
}
