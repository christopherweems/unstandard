//  SetResult.swift
//  8/12/21

@resultBuilder
public struct SetResult {
    public static func buildBlock<Element : Hashable>(_ elements: Set<Element>...) -> Set<Element> {
        Set(elements.flatMap { $0 })
    }
    
    public static func buildEither<Element: Hashable>(first: Set<Element>) -> Set<Element> {
        first
    }
    
    public static func buildEither<Element: Hashable>(second: Set<Element>) -> Set<Element> {
        second
    }
    
}

public extension SetResult {
    static func buildExpression<Element: Hashable>(_ element: Element) -> Set<Element> {
        [element]
    }
    
}


// MARK: - SetResult for Set<UUID>

#if canImport(Foundation)
import Foundation

public extension SetResult {
    static func buildExpression(_ uuid: uuid_t) -> Set<UUID> {
        [.init(uuid: uuid)]
    }
    
}

#endif
