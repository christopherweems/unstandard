//
//  CGPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/22/20.
//

#if canImport(CoreGraphics)
import CoreGraphics


// MARK: - Operators

extension CGPoint {
    public static func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    public static func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x/rhs, y: lhs.y/rhs)
    }
    
    public static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
    }
    
    public static func -(_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static prefix func -(_ point: CGPoint) -> CGPoint {
        .init(x: -point.x, y: -point.y)
    }
    
    public static func +=(lhs: inout CGPoint, rhs: CGPoint) {
        lhs.x += rhs.x
        lhs.y += rhs.y
    }
    
    public static func -=(lhs: inout CGPoint, rhs: CGPoint) {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
    }
    
}


// MARK: - Calculating Distances

extension CGPoint {
    public func distance(to point: CGPoint) -> CGFloat {
        let xOffset = point.x - x
        let yOffset = point.y - y
        return sqrt(xOffset * xOffset + yOffset * yOffset)
    }
    
}


// MARK: - Rounding

extension CGPoint {
    public func rounded(scale: CGFloat) -> CGPoint {
        var rounded = CGPoint()
        rounded.x = (x * scale).rounded() / scale
        rounded.y = (y * scale).rounded() / scale
        
        return rounded
    }
    
}



// MARK: - Magnitude

extension CGPoint {
    public var magnitude: CGFloat {
        (x * x + y * y).squareRoot()
    }
    
}

extension Optional where Wrapped == CGPoint {
    public var magnitude: CGFloat {
        self?.magnitude ?? 0.0
    }
    
}

// MARK: - Computing an angle (from origin)

// Ex: (1, 0), (5, 0) == 0
//     (0, 2), (0, 8) == 0.7853981634 == τ/4 == 𝝿/2
public extension CGPoint {
    var angle: CGFloat {
        let normalized = self / magnitude
        var angle = asin(normalized.y)
        
        switch (x, y) {
        case (..<0, _):
            angle = .pi - angle
            
        case (_, ..<0):
            angle += .tau
            
        default:
            break
            
        }
        
        return angle
    }
    
}


// MARK: - Conversion to/from CGSize

public extension CGPoint {
    func asCGSize() -> CGSize {
        .init(width: x, height: y)
    }
}

extension CGPoint {
    public init(_ size: CGSize) {
        self = CGPoint(x: size.width, y: size.height)
        
    }
    
}

#endif
