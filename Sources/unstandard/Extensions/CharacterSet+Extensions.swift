//
//  CharacterSet+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/30/20.
//

import Foundation

public extension CharacterSet {
    static func +(_ lhs: CharacterSet, _ rhs: String) -> CharacterSet {
        lhs.union(.init(charactersIn: rhs))
    }
    
    static func -(lhs: CharacterSet, rhs: String) -> CharacterSet {
        let removeSet = CharacterSet(charactersIn: rhs)
        return lhs.subtracting(removeSet)
    }
}
