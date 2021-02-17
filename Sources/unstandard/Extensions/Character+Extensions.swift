//  Character+Extensions.swift
//  Created by Christopher Weems on 2/9/21

import Foundation

public extension Character {
    func asString() -> String {
        String(self)
    }
    
}

extension Array where Element == Character {
    public func asString() -> String {
        String(self)
    }
    
}
