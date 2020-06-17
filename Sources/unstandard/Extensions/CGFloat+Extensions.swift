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

#endif
