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

public extension Binding where Value == CGFloat? {
    var isNil: Bool { wrappedValue == nil }
    
}

#endif
