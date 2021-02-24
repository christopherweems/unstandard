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


// MARK: - `Range.offset(_:in:)`

public extension Range {
    mutating func offset<C: Collection>(_ offset: Int, in collection: C) where Bound == C.Index {
        let newLowerBound = collection.index(lowerBound, offsetBy: offset)
        let newUpperBound = collection.index(upperBound, offsetBy: offset)
        
        self = newLowerBound..<newUpperBound
    }
    
}
