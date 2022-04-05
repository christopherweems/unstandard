//
//  CharacterSet+Operators.swift
//  
//
//  Created by Christopher Weems on 11/4/21.
//

import Foundation

extension CharacterSet {
    public static func +(_ lhs: CharacterSet, _ rhs: CharacterSet) -> CharacterSet {
        lhs.union(rhs)
    }
    
    public static func +(_ lhs: CharacterSet, _ rhs: String) -> CharacterSet {
        lhs.union(.init(charactersIn: rhs))
    }
    
    public static func -(lhs: CharacterSet, rhs: String) -> CharacterSet {
        let removeSet = CharacterSet(charactersIn: rhs)
        return lhs.subtracting(removeSet)
    }
    
}
