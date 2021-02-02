//
//  SetBuilder.swift
//  
//
//  Created by Christopher Weems on 8/30/20.
//

import Foundation

@resultBuilder
public struct SetBuilder<Element> where Element: Hashable {
    public static func buildBlock(_ elements: Set<Element>...) -> Set<Element> {
        elements
            .flatMap { $0 }
            .asSet()
    }
    
    public static func buildEither(first: Set<Element>) -> Set<Element> {
        first
    }

    public static func buildEither(second: Set<Element>) -> Set<Element> {
        second
    }

    public static func buildOptional(_ elements: Set<Element>?) -> Set<Element> {
        elements ?? []
    }
}

public extension SetBuilder {
    static func buildExpression(_ elements: Element...) -> Set<Element> {
        elements.asSet()
    }
}
