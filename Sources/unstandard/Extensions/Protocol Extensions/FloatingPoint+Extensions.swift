//
//  FloatingPoint+Extensions.swift
//
//
//  Created by Christopher Weems on 8/20/19.
//


// MARK: - Golden Ratio

public extension FloatingPoint {
    static var phi: Self {
        (Self.init(1) + Self.init(5).squareRoot()) / Self.init(2)
    }
    
    static var phiInverse: Self {
        Self.init(2) / (Self.init(1) + Self.init(5).squareRoot())
    }
    
}


// MARK: - Multiplicative Inverse

public extension FloatingPoint {
    var multiplicativeInverse: Self { 1 / self }
    
}


// MARK: - Tau / Circle Methods

public extension FloatingPoint {
    static var tau: Self { .pi * 2 }
    
}

public extension FloatingPoint {
    func shifted(byClockwiseRotations period: Self) -> Self {
        self + period * .tau
    }
    
}


// MARK: - Bound Within Range

public extension FloatingPoint {
    func bounded(within range: ClosedRange<Self>) -> Self {
        switch self {
        case (...range.lowerBound):
            return range.lowerBound
            
        case (range.upperBound...):
            return range.upperBound
            
        default:
            return self
        }
    }
    
    mutating func bound(within range: ClosedRange<Self>) {
        self = self.bounded(within: range)
    }
    
}


// MARK: - Is Within

public extension FloatingPoint {
    func isWithin(_ range: ClosedRange<Self>) -> Bool {
        range.lowerBound <= self && self <= range.upperBound
    }
    
}


// MARK: - Initialize from Boolean Value

public extension FloatingPoint {
    init(_ value: Bool) {
        self.init(boolValue ? 1 : 0)
    }
    
}
