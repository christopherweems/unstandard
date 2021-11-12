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

extension BinaryFloatingPoint {
    public static func **(_ base: Self, exponent: Double) -> Double {
        pow(Double(base), exponent)
    }
    
}

extension BinaryFloatingPoint {
    public static func *(base: Self, sign: FloatingPointSign) -> Self {
        let multiplier: Self = (sign == .plus) ? +1 : -1
        return base * multiplier
    }
    
    public static func *(sign: FloatingPointSign, base: Self) -> Self {
        return base * sign
    }
    
}

extension BinaryFloatingPoint {
    public func `as`<Result>(_ resultType: Result.Type) -> Result where Result : BinaryInteger {
        Result(self)
    }
    
}

extension BinaryFloatingPoint {
    public mutating func bound(within range: PartialRangeFrom<Self>) {
        self.bound(within: range.lowerBound...(.infinity))
    }
    
}

extension BinaryFloatingPoint {
    public func bounded(within boundingRange: PartialRangeFrom<Self>) -> Self {
        self < boundingRange.lowerBound ? boundingRange.lowerBound : self
    }
    
    public func bounded(within boundingRange: PartialRangeUpTo<Self>) -> Self {
        self < boundingRange.upperBound ? self : boundingRange.upperBound
    }
    
}
