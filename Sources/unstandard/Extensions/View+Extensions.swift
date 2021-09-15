//
//  View+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/10/20.
//

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
@available(*, deprecated, message: "moved to `unstandard-ui` package")
extension View {
    public func eraseToAnyView() -> AnyView {
        .init(self)
    }
    
}

#endif
