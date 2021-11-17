//
//  ClosedRange+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/17/21.
//

extension ClosedRange where Bound : Numeric {
    public static func >>(range: Self, shift: Bound) -> ClosedRange {
        .init(uncheckedBounds: (range.lowerBound + shift, range.upperBound + shift))
    }
    
    public static func <<(range: Self, shift: Bound) -> ClosedRange {
        .init(uncheckedBounds: (range.lowerBound - shift, range.upperBound - shift))
    }
    
}

extension ClosedRange where Bound : Numeric {
    public func reflected(across origin: Bound = .zero) -> ClosedRange {
        let lowerBound = origin - self.upperBound
        let upperBound = origin - self.lowerBound
        return .init(uncheckedBounds: (lowerBound, upperBound))
    }
    
}

extension ClosedRange where Bound : Numeric {
    public var length: Bound {
        upperBound - lowerBound
    }
    
}
