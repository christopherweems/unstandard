//
//  CGRect+Extensinos.swift
//  
//
//  Created by Christopher Weems on 9/19/20.
//


#if canImport(CoreGraphics)

import CoreGraphics

extension CGRect {
    public var midPoint: CGPoint {
        .init(x: midX, y: midY)
    }
    
}

extension CGRect {
    public var maxSize: CGSize {
        .init(width: maxX, height: maxY)
    }
    
}


#endif
