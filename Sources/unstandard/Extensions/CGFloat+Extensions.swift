//
//  CoreGraphics+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/16/20.
//

#if canImport(CoreGraphics)
import struct CoreGraphics.CGFloat

public extension CGFloat {
    func asDouble() -> Double {
        .init(self)
    }
}


// MARK: - Rounding

public extension CGFloat {
    mutating func round(scale: CGFloat) {
        self = rounded(scale: scale)
    }
    
    func rounded(scale: CGFloat) -> CGFloat {
        return (self * scale).rounded() / scale
    }
}


// MARK: - Optional<CGFloat> `+=` * `-=`

public extension Optional where Wrapped == CGFloat {
    static func +=(_ lhs: inout Self, _ rhs: Wrapped) {
        switch lhs {
        case .some(let wrapped):
            lhs = wrapped + rhs
        
        case .none:
            return
        }
    }
    
    static func -=(_ lhs: inout Self, _ rhs: Wrapped) {
        switch lhs {
        case .some(let wrapped):
            lhs = wrapped - rhs
        
        case .none:
            return
        }
    }
    
}


#endif
