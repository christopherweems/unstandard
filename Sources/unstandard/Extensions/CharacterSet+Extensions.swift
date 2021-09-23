//
//  CharacterSet+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/30/20.
//

import Foundation

extension CharacterSet {
    public static let hyphens: CharacterSet = {
        ["-"]
    }()
    
}


// MARK: - Operators

extension CharacterSet {
    public static func +(_ lhs: CharacterSet, _ rhs: String) -> CharacterSet {
        lhs.union(.init(charactersIn: rhs))
    }
    
    public static func -(lhs: CharacterSet, rhs: String) -> CharacterSet {
        let removeSet = CharacterSet(charactersIn: rhs)
        return lhs.subtracting(removeSet)
    }
    
}
