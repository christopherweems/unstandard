//
//  PairBuilder.swift
//  
//
//  Created by Christopher Weems on 11/12/20.
//

import Foundation

@_functionBuilder
public struct PairBuilder {
    public static func buildBlock<E>(_ lhs: E, _ rhs: E) -> (E, E) {
        (lhs, rhs)
    }
    
}
