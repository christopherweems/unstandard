//
//  CGRect+Extensinos.swift
//  
//
//  Created by Christopher Weems on 9/19/20.
//


#if canImport(CoreGraphics)

import CoreGraphics

public extension CGRect {
    var midPoint: CGPoint {
        .init(x: midX, y: midY)
    }
    
}


#endif
