//
//  FirstNonNil.swift
//  
//
//  Created by Christopher Weems on 10/4/20.
//

@_functionBuilder
public struct FirstNonNil {
    public static func buildBlock<Result>(_ elements: Result?...) -> Result {
        guard let firstNonNil = elements.first(where: { $0 != nil }) ?? nil else { fatalError() }
        return firstNonNil
    }
    
    public static func buildExpression<Result>(_ element: Result) -> Result? {
        element
    }
    
    public static func buildExpression<Result>(_ element: Result?) -> Result? {
        element
    }
    
}
