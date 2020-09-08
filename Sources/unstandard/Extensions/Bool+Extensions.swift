//
//  Bool+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/8/20.
//

import Foundation

public extension Bool {
    static func &=(_ lhs: inout Bool, _ rhs: Bool) {
        lhs = lhs && rhs
    }
    
}
