//
//  ForEach+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/18/20.
//

#if canImport(SwiftUI)
import SwiftUI

@available(*, deprecated)
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension ForEach where Data == Range<Int>, ID == Int, Content : View {
    init(_ range: ClosedRange<Int>, @ViewBuilder content: @escaping (Int) -> Content) {
        self.init(range.lowerBound..<(range.upperBound + 1), id: \.hashValue, content: content)
    }
    
}

#endif
