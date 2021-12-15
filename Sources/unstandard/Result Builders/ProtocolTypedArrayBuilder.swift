//
//  ProtocolTypedArrayBuilder.swift
//  
//
//  Created by Christopher Weems on 3/21/20.
//

@available(*, deprecated, renamed: "ProtocolTypedArrayBuilder")
public typealias SimpleArrayBuilder = ProtocolTypedArrayBuilder

@resultBuilder
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
    
    public static func buildArray(_ components: [[Element]]) -> [Element] {
        components.flatMap { $0 }
    }
    
}

extension ProtocolTypedArrayBuilder {
    public static func buildExpression(_ singleElement: Element) -> [Element] {
        [singleElement]
    }
    
}
