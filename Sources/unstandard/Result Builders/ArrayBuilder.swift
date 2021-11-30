//
//  ArrayBuilder.swift
//  
//
//  Created by Christopher Weems on 9/22/20.
//

@resultBuilder
public struct ArrayBuilder {
    public static func buildBlock<Element>(_ subarrays: [Element]...) -> [Element] {
        subarrays.flatMap { $0 }
    }
    
    public static func buildOptional<Element>(_ optional: [Element]?) -> [Element] {
        optional ?? []
    }
    
    public static func buildEither<Element>(first: [Element]) -> [Element] {
        first
    }
    
    public static func buildEither<Element>(second: [Element]) ->[Element] {
        second
    }
    
    public static func buildArray<Element>(_ components: [[Element]]) -> [Element] {
        components.flatMap { $0 }
    }
    
}


extension ArrayBuilder {
    public static func buildExpression<Element>(_ subarray: [Element]) -> [Element] {
        subarray
    }
    
    public static func buildExpression<Element>(_ components: ArraySlice<Element>) -> [Element] {
        components.map { $0 }
    }
    
    public static func buildExpression<Element>(_ item: Element) -> [Element] {
        [item]
    }
    
    public static func buildExpression<Element>(_ optional: Element?) -> [Element] {
        guard let optional = optional else { return [] }
        return [optional]
    }
    
}
