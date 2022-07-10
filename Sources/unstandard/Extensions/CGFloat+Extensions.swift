//
//  CoreGraphics+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/16/20.
//

#if canImport(CoreGraphics)
import struct CoreGraphics.CGFloat
import func CoreGraphics.pow

extension CGFloat {
    public func asDouble() -> Double {
        .init(self)
    }
    
}


// MARK: - Rounding

extension CGFloat {
    public mutating func round(scale: CGFloat) {
        self = rounded(scale: scale)
    }
    
    public func rounded(scale: CGFloat) -> CGFloat {
        return (self * scale).rounded() / scale
    }
    
}


// MARK: - Optional<CGFloat> `+=` * `-=`

extension Optional where Wrapped == CGFloat {
    public static func +=(_ lhs: inout Self, _ rhs: CGFloat) {
        guard let currentValue = lhs else { return }
        lhs = Optional(currentValue + rhs)
    }

    public static func -=(_ lhs: inout Self, _ rhs: Wrapped) {
        guard let currentValue = lhs else { return }
        lhs = Optional(currentValue + rhs)
    }
    
}

extension CGFloat {
    public static func **(base: CGFloat, exponent: some BinaryInteger) -> CGFloat {
        pow(base, CGFloat(exponent))
    }
    
}

#endif
