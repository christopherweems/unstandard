//
//  CGPoint+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/22/20.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGPoint {
    func asCGSize() -> CGSize {
        .init(width: x, height: y)
    }
}

#endif
