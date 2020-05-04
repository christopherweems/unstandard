//
//  NSRegularExpression+Extensions.swift
//  
//
//  Created by Christopher Weems on 3/30/20.
//

import Foundation

public extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
            
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
            
        }
    }
}
