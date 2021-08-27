//
//  String.Index+Extensions.swift
//
//
//  Created by Christopher Weems on 7/29/21.
//

public extension String.Index {
    mutating func increment(in base: String) {
        self = base.index(after: self)
    }
    
    mutating func decrement(in base: String) {
        self = base.index(before: self)
    }
    
}
