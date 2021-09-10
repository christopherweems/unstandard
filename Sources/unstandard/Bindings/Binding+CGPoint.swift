//
//  Binding+CGPoint.swift
//  
//
//  Created by Christopher Weems on 6/16/20.
//

#if canImport(CoreGraphics) && canImport(SwiftUI)
import Foundation
import CoreGraphics
import struct SwiftUI.Binding

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Binding where Value == CGPoint {
    var magnitude: CGFloat {
        self.wrappedValue.magnitude
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Binding where Value == CGPoint? {
    var magnitude: CGFloat {
        self.wrappedValue?.magnitude ?? 0
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Binding where Value == CGPoint? {
    var isNil: Bool { wrappedValue == nil }
    
}

#endif
