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


// MARK: - Decimal Sequence Extensions

extension Sequence where Element == Decimal {
    func inverses() -> [Element] {
        self.map { 1 / $0 }
    }
    
}
