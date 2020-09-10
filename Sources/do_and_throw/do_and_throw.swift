//
//  do_and_throw.swift
//  
//
//  Created by Christopher Weems on 9/10/20.
//

import Foundation

/// runs closure throwing any errors, then throws even
public func do_and_throw<T>(_ t: () throws -> T) throws {
    try _ = t()
    throw DoAndThrowError.do_and_throw_error
}
    

/// does nothing
public func do_not<T>(_ t: () throws -> T) {
    
}
