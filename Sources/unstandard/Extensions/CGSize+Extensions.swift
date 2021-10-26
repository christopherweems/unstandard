//
//  CGSize+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/5/20.
//

#if canImport(CoreGraphics)
import CoreGraphics

extension CGSize {
    public static func /(size: CGSize, divisor: CGFloat) -> CGSize {
        precondition(divisor != 0)
        return CGSize(width: size.width / divisor, height: size.height / divisor)
    }
    
    public static func *(size: CGSize, multiplier: CGFloat) -> CGSize {
        return CGSize(width: size.width * multiplier, height: size.height * multiplier)
    }
    
    public static func *<M>(_ size: Self, multiplier: M) -> CGSize where M : BinaryInteger {
        return size * CGFloat(multiplier)
    }
    
}

extension CGSize {
    public static func -(lhs: CGSize, rhs: CGSize) -> Self {
        .init(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    public func asCGPoint() -> CGPoint {
        .init(x: width, y: height)
    }
    
}

extension CGSize {
    public static prefix func -(size: CGSize) -> CGSize {
        .init(width: -size.width, height: -size.height)
    }
    
}

extension CGSize {
    public var aspectRatio: CGFloat {
        guard height.isFinite && height != .zero else { return .nan }
        return width / height
    }
    
}

extension CGSize {
    public func rounded(scale: CGFloat) -> Self {
        let width = (self.width * scale).rounded(.toNearestOrAwayFromZero)
        let height = (self.height * scale).rounded(.toNearestOrAwayFromZero)
        return .init(width: width, height: height) / scale
    }
    
    @available(*, deprecated, renamed: "rounded(scale:)")
    public func rounded(displayScale: CGFloat) -> Self {
        return self.rounded(scale: displayScale)
    }
    
}


// MARK: - Max Size

extension CGSize {
    public var maxSide: CGFloat {
        max(width, height)
    }
    
    public var minSide: CGFloat {
        min(width, height)
    }
    
}


// MARK: - Magnitude

extension CGSize {
    public var magnitude: CGFloat {
        (width * width + height * height).squareRoot()
    }
    
}

// MARK: - Finding the midpoint

public extension CGSize {
    var midPoint: CGPoint {
        .init(x: width / 2, y: height / 2)
    }
    
}

// MARK: - Components Ascending

extension CGSize {
    public func components(ascending: Bool) -> (CGFloat, CGFloat) {
        let components = [width, height].sorted { ascending ? $0 < $1 : $1 < $0 }
        return (components[0], components[1])
    }
    
}


// MARK: - Creating a CGRect

extension CGSize {
    public func withOrigin(_ origin: CGPoint) -> CGRect {
        CGRect(origin: origin, size: self)
    }
    
}


#endif
