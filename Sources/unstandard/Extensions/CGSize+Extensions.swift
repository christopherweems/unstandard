//
//  CGSize+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/5/20.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGSize {
    static func /(size: CGSize, divisor: CGFloat) -> CGSize {
        precondition(divisor != 0)
        return CGSize(width: size.width / divisor, height: size.height / divisor)
    }
    
    static func *(size: CGSize, multiplier: CGFloat) -> CGSize {
        return CGSize(width: size.width * multiplier, height: size.height * multiplier)
    }
    
}

public extension CGSize {
    static func -(lhs: CGSize, rhs: CGSize) -> Self {
        .init(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    func asCGPoint() -> CGPoint {
        .init(x: width, y: height)
    }
}

#endif
