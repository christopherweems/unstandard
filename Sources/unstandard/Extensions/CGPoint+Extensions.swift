//
//  CGPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/22/20.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGPoint {
    static func +(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func -(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

public extension CGPoint {
    func asCGSize() -> CGSize {
        .init(width: x, height: y)
    }
}

#endif
