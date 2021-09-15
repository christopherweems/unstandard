//
//  Binding+Bool.swift
//  
//
//  Created by Christopher Weems on 7/2/20.
//

#if canImport(SwiftUI)
import Foundation
import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(*, deprecated, message: "Moved to `unstandard-ui` package")
public extension Binding where Value == Bool {
    prefix static func !(_ binding: Self) -> Bool {
        !binding.wrappedValue
    }
}

#endif
