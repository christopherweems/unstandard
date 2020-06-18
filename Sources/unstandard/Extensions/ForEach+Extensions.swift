//
//  ForEach+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/18/20.
//

#if canImport(SwiftUI)
import SwiftUI

public extension ForEach where Data == Range<Int>, ID == Int, Content : View {
    init(_ range: ClosedRange<Int>, @ViewBuilder content: @escaping (Int) -> Content) {
        self.init(range.lowerBound..<(range.upperBound + 1), content: content)
    }
}

#endif
