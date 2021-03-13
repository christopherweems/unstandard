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

public extension CGSize {
    static prefix func -(size: CGSize) -> CGSize {
        .init(width: -size.width, height: -size.height)
    }
    
}

public extension CGSize {
    var aspectRatio: CGFloat {
        guard height.isFinite && height != .zero else { return .nan }
        return width / height
    }
}

public extension CGSize {
    func rounded(displayScale: CGFloat) -> Self {
        let width = (self.width * displayScale).rounded(.toNearestOrAwayFromZero)
        let height = (self.height * displayScale).rounded(.toNearestOrAwayFromZero)
        return .init(width: width, height: height) / displayScale
    }
}


#endif
