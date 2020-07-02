//
//  Binding+Bool.swift
//  
//
//  Created by Christopher Weems on 7/2/20.
//

#if canImport(SwiftUI)
import Foundation
import SwiftUI

public extension Binding where Value == Bool {
    prefix static func !(_ binding: Self) -> Bool {
        !binding.wrappedValue
    }
}

#endif
