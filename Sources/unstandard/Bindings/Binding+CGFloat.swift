//
//  Binding+CGFloat.swift
//  
//
//  Created by Christopher Weems on 6/16/20.
//

#if canImport(CoreGraphics) && canImport(SwiftUI)
import Foundation
import CoreGraphics
import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(*, deprecated, message: "Moved to `unstandard-ui` package")
public extension Binding where Value == CGFloat? {
    var isNil: Bool { wrappedValue == nil }
    
}

#endif
