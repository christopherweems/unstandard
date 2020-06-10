//
//  View+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/10/20.
//

#if canImport(SwiftUI)
import SwiftUI

public extension View {
    func eraseToAnyView() -> AnyView {
        .init(self)
    }
}

#endif
