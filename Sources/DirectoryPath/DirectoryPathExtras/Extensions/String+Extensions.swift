//
//  String+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/26/21.
//

internal func ==(lhs: String?, rhs: String.SubSequence) -> Bool {
    guard let lhs = lhs else { return false }
    return lhs == rhs
}

internal func ==(lhs: String.SubSequence, rhs: String?) -> Bool {
    guard let rhs = rhs else { return false }
    return lhs == rhs
}
