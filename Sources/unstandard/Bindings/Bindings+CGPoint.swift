//
//  Bindings+CGPoint.swift
//  
//
//  Created by Christopher Weems on 6/16/20.
//

#if canImport(CoreGraphics) && canImport(SwiftUI)
import Foundation
import CoreGraphics
import struct SwiftUI.Binding

public extension Binding where Value == CGPoint {
    var magnitude: CGFloat {
        self.wrappedValue.magnitude
    }
}

public extension Binding where Value == CGPoint? {
    var magnitude: CGFloat {
        self.wrappedValue?.magnitude ?? 0
    }
}

#endif
