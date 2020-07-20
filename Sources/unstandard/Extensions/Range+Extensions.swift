//
//  Range+Extensions.swift
//  
//
//  Created by Christopher Weems on 7/20/20.
//

import Foundation

public extension Range where Bound : SignedNumeric {
    static var zero: Self { (.zero)..<(.zero) }
    
}

public extension Range where Bound: FloatingPoint {
    static func /(_ lhs: Self, _ rhs: Bound) -> Range {
        (lhs.lowerBound/rhs)..<(lhs.upperBound/rhs)
    }
}
