//
//  NSPredicate+Extensions.swift
//
//
//  Created by Christopher Weems on 11/9/17.
//

import Foundation

public extension NSPredicate {
    static var `true`: NSPredicate {
        .init(block: { _, _ in true })
    }
    
    static var `false`: NSPredicate {
        .init(block: { _, _ in false })
    }
}
