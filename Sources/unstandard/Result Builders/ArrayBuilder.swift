//
//  ArrayBuilder.swift
//  
//
//  Created by Christopher Weems on 9/22/20.
//

import Foundation

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


public extension ArrayBuilder {
    static func buildExpression<Element>(_ subarray: [Element]) -> [Element] {
        subarray
    }
    
    static func buildExpression<Element>(_ item: Element) -> [Element] {
        [item]
    }
    
    static func buildExpression<Element>(_ optional: Element?) -> [Element] {
        guard let optional = optional else { return [] }
        return [optional]
    }
    
}
