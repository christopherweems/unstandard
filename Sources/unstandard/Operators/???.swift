//
//  ???.swift
//  
//
//  Created by Christopher Weems on 12/1/20.
//

infix operator ???: AdditionPrecedence

public func ???<A>(_ first: A?, _ other: A) -> A? {
    first ?? other
}
