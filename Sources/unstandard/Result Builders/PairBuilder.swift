//
//  PairBuilder.swift
//  
//
//  Created by Christopher Weems on 11/12/20.
//

@resultBuilder
public struct PairBuilder {
    /*
    public static func buildBlock<E>(_ lhs: E, _ rhs: E) -> (E, E) {
        (lhs, rhs)
    }
    */
    
    public static func buildBlock<A,B>(_ first: A, _ second: B) -> (A, B) {
        (first, second)
    }
    
}
