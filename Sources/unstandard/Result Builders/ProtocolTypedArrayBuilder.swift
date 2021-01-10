//
//  ProtocolTypedArrayBuilder.swift
//  
//
//  Created by Christopher Weems on 3/21/20.
//

import Foundation

@available(*, deprecated, renamed: "ProtocolTypedArrayBuilder")
public typealias SimpleArrayBuilder = ProtocolTypedArrayBuilder

@_functionBuilder
public struct ProtocolTypedArrayBuilder<Element> {
    public static func buildBlock(_ subarrays: [Element]...) -> [Element] {
        subarrays.flatMap { $0 }
    }
        
    public static func buildEither(first: [Element]) -> [Element] {
        first
    }
    
    public static func buildEither(second: [Element]) -> [Element] {
        second
    }
    
    public static func buildOptional(_ subarray: [Element]?) -> [Element] {
        subarray ?? []
    }
    
}

extension ProtocolTypedArrayBuilder {
    public static func buildExpression(_ singleElement: Element) -> [Element] {
        [singleElement]
    }
    
}
