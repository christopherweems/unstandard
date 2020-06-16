//
//  CGPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/22/20.
//

#if canImport(CoreGraphics)
import CoreGraphics


// MARK: - Operators

public extension CGPoint {
    static func +(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func -(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}


// MARK: - Magnitude

public extension CGPoint {
    var magnitude: CGFloat {
        (x * x + y * y).squareRoot()
    }
}

public extension Optional where Wrapped == CGPoint {
    var magnitude: CGFloat {
        self?.magnitude ?? 0.0
    }
}

// MARK: - Conversions

public extension CGPoint {
    func asCGSize() -> CGSize {
        .init(width: x, height: y)
    }
}

#endif
