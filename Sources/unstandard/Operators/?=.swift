//
//  ?=.swift
//  
//
//  Created by Christopher Weems on 1/12/21.
//

infix operator ?=: AssignmentPrecedence

@available(*, deprecated, message: "a quick challenge for you, `?=` is going away")
public func ?=<F>(lhs: inout F, rhs: Optional<F>) {
    guard let rhs = rhs else { return }
    lhs = rhs
    
}
