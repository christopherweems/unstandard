//
//  BinaryFloatingPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/28/20.
//

import Foundation

precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator ** : ExponentiationPrecedence

public extension BinaryFloatingPoint {
    static func **(_ base: Self, exponent: Double) -> Double {
        pow(Double(base), exponent)
    }
}

public extension BinaryFloatingPoint {
    mutating func bound(within range: PartialRangeFrom<Self>) {
        self.bound(within: range.lowerBound...(.infinity))
    }
}

public extension BinaryFloatingPoint {
    func bounded(within boundingRange: PartialRangeFrom<Self>) -> Self {
        self < boundingRange.lowerBound ? boundingRange.lowerBound : self
    }
    
    func bounded(within boundingRange: PartialRangeUpTo<Self>) -> Self {
        self < boundingRange.upperBound ? self : boundingRange.upperBound
    }
    
}
