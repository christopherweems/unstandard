//
//  FloatingPoint+Extensions.swift
//
//
//  Created by Christopher Weems on 8/20/19.
//


// MARK: - Golden Ratio

extension FloatingPoint {
    public static var phi: Self {
        (Self.init(1) + Self.init(5).squareRoot()) / Self.init(2)
    }
    
    public static var phiInverse: Self {
        Self.init(2) / (Self.init(1) + Self.init(5).squareRoot())
    }
    
}


// MARK: - Multiplicative Inverse

extension FloatingPoint {
    public var multiplicativeInverse: Self { 1 / self }
    
}


// MARK: - Tau / Circle Methods

extension FloatingPoint {
    public static var tau: Self { .pi * 2 }
    
}

extension FloatingPoint {
    public func shifted(byClockwiseRotations period: Self) -> Self {
        self + period * .tau
    }
    
}


// MARK: - Bound Within Range

extension FloatingPoint {
    public func bounded(within range: ClosedRange<Self>) -> Self {
        switch self {
        case (...range.lowerBound):
            return range.lowerBound
            
        case (range.upperBound...):
            return range.upperBound
            
        default:
            return self
        }
    }
    
    public mutating func bound(within range: ClosedRange<Self>) {
        self = self.bounded(within: range)
    }
    
}


// MARK: - Is Within

extension FloatingPoint {
    public func isWithin(_ range: ClosedRange<Self>) -> Bool {
        range.lowerBound <= self && self <= range.upperBound
    }
    
}


// MARK: - Initialize from Boolean Value

extension FloatingPoint {
    public init(_ value: Bool) {
        self.init(value ? 1 : 0)
    }
    
}


// MARK: - Multiplying by Sign

public func *<FP: FloatingPoint>(_ sign: FloatingPointSign, _ rhs: FP) -> FP {
    switch sign {
    case .plus:
        return rhs
        
    case .minus:
        return -rhs
    }
}


// MARK: - FloatingPoint Sequence Extensions

extension Sequence where Element : FloatingPoint {
    func inverses() -> [Element] {
        self.map { 1 / $0 }
    }
    
}
