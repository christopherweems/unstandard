//
//  SingleResult.swift
//  
//
//  Created by Christopher Weems on 10/13/20.
//

import Foundation

@_functionBuilder
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