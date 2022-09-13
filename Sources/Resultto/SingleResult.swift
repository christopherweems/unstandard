//  SingleResult.swift
//  12/4/20

@resultBuilder
public struct SingleResult {
    public static func buildBlock<E>(_ element: E) -> E {
        element
    }
    
    public static func buildEither<E>(first: E) -> E {
        first
    }
    
    public static func buildEither<E>(second: E) -> E {
        second
    }
    
}
