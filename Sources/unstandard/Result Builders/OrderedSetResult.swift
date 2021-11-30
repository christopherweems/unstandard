//
//  OrderedSetResult.swift
//  
//
//  Created by Christopher Weems on 8/9/21.
//

@_exported import struct OrderedCollections.OrderedSet

@resultBuilder
public struct OrderedSetResult {
    public static func buildFinalResult<Element: Hashable>(_ component: [Element]) -> OrderedSet<Element> {
        .init(component)
    }
    
    public static func buildBlock<Element: Hashable>(_ elements: [Element]...) -> [Element] {
        elements.flatMap { $0 }
    }
    
    public static func buildEither<Element: Hashable>(first: [Element]) -> [Element] {
        first
    }
    
    public static func buildEither<Element: Hashable>(second: [Element]) -> [Element] {
        second
    }
    
    public static func buildOptional<Element: Hashable>(_ element: Element?) -> [Element] {
        guard let element = element else { return [] }
        return [element]
    }
    
    public static func buildArray<Element: Hashable>(_ components: [[Element]]) -> [Element] {
        components.flatMap { $0 }
    }
    
    public static func buildLimitedAvailability<Element: Hashable>(_ component: [Element]) -> [Element] {
        component
    }
    
    public static func buildExpression<Element: Hashable>(_ expression: Element) -> [Element] {
        [expression]
    }
    
}
