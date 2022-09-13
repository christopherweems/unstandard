//  AllTrue.swift
//  1/1/21

@resultBuilder
public struct AllTrue {
    public static func buildBlock(_ elements: Bool...) -> Bool {
        elements.allSatisfy { $0 == true }
    }
    
    public static func buildEither(first: Bool) -> Bool {
        first == true
    }
    
    public static func buildEither(second: Bool) -> Bool {
        second == true
    }
    
}
