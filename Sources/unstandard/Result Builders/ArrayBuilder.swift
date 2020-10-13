//
//  ArrayBuilder.swift
//  
//
//  Created by Christopher Weems on 9/22/20.
//

import Foundation

@_functionBuilder
public struct ArrayBuilder {
    public static func buildBlock<Element>(_ subarrays: [Element]...) -> [Element] {
        subarrays.flatMap { $0 }
    }
    
    static func buildOptional<Element>(_ optional: [Element]?) -> [Element] {
        optional ?? []
    }
    
    static func buildEither<Element>(first: [Element]) -> [Element] {
        first
    }

    static func buildEither<Element>(second: [Element]) ->[Element] {
        second
    }
    
}


public extension ArrayBuilder {
    static func buildExpression<Element>(_ subarray: [Element]) -> [Element] {
        subarray
    }
    
    static func buildExpression<Element>(_ item: Element) -> [Element] {
        [item]
    }
    
}
