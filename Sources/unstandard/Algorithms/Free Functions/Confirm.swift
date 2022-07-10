//
//  Confirm.swift
//
//
//  Created by Christopher Weems on 7/27/21.
//

import Resultto

public func confirm<E: Error>(
    throwing failureError: E,
    @SingleResult predicate: () -> Bool
) throws {
    switch predicate() {
    case true:
        break
        
    case false:
        throw failureError
        
    }
}
