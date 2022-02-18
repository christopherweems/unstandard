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

extension Range where Bound: Numeric {
    public static func *(_ lhs: Self, _ rhs: Bound) -> Self {
        (lhs.lowerBound * rhs)..<(lhs.upperBound * rhs)
    }
    
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


// MARK: - `Range.enumerateRanges(anchoredAt:)`

public enum RangePosition {
    case start
    case end
    
}

extension Range where Bound : Strideable, Bound.Stride : SignedInteger, Bound.Stride.Stride : SignedInteger {
    public typealias Position = RangePosition
    
    public func enumerateRanges(_anchoredAt position: Range.Position) -> [Self] {
        let rangeLength = startIndex.distance(to: endIndex)
        
        switch position {
        case .start:
            return (1..<rangeLength).map {
                let upperBound = startIndex.advanced(by: $0)
                return (startIndex..<upperBound)
            }
            
        case .end:
            return (0..<rangeLength).map {
                let lowerBound = startIndex.advanced(by: $0)
                return (lowerBound..<upperBound)
            }
        }
    }
    
}


// MARK: -

extension Range where Bound : BinaryInteger {
    public func offset(_ offset: Bound) -> Self {
        Range(uncheckedBounds: (self.lowerBound + offset, self.upperBound + offset))
    }
    
}


// MARK: - Bounding Ranges

extension Range {
    public func bounded(within bound: Range<Bound>) -> Self {
        let lowerBound = Swift.max(self.lowerBound, bound.lowerBound)
        let upperBound = Swift.min(self.upperBound, bound.upperBound)
        return (lowerBound..<upperBound)
    }
    
    public func bounded(within bound: PartialRangeThrough<Bound>) -> Self {
        let lowerBound = Swift.min(self.lowerBound, bound.upperBound)
        let upperBound = Swift.min(self.upperBound, bound.upperBound)
        return (lowerBound..<upperBound)
    }
    
}


// MARK: -

extension Range {
    public init?(intersectionOf ranges: Self...) {
        let lowerBound: Bound! = ranges.min(by: { $0.lowerBound < $1.lowerBound })?.lowerBound
        let upperBound: Bound! = ranges.max(by: { $0.upperBound > $1.upperBound })?.upperBound
        if lowerBound == nil || upperBound == nil { return nil }
        self.init(uncheckedBounds: (lowerBound, upperBound))
    }
    
}
