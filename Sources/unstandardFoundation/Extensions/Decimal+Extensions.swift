//
//  Decimal+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/29/21.
//

import Foundation

extension Decimal {
    public var inverse: Decimal {
        1 / self
    }
    
}

extension Decimal {
    public func rounded(_ roundingMode: RoundingMode = .plain) -> Decimal {
        var value = self
        var result = Decimal.zero
        NSDecimalRound(&result, &value, 0, roundingMode)
        return result
    }
    
}

extension Decimal {
    public var integerPart: Decimal {
        self.rounded(self < 0 ? .up : .down)
    }
    
    // (3.14).fractionPart == 0.14
    // (-3.14).fractionPart == 0.14
    public var fractionPart: Decimal {
        guard self <= -1 || 1 <= self else {
            return self
        }
        
        switch self.isSignMinus {
        case false:
            return self - self.rounded(.down)
            
        case true:
            return self + self.rounded(.up)
            
        }
    }
    
}

extension Decimal {
    // Does not currently report overflow, fix this before removing _ from function declaration
    public func remainderReportingOverflow(_dividingBy other: Decimal) -> (partialValue: Decimal, overflow: Bool) {
        let divisionResult = (self / other).rounded(.plain)
        return (self - divisionResult * other, false)
    }
    
}


// MARK: - Decimal Sequence Extensions

extension Sequence where Element == Decimal {
    func inverses() -> [Element] {
        self.map { 1 / $0 }
    }
    
}
