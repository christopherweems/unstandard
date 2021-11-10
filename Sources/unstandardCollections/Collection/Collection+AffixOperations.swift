//
//  Collection+AffixOperations.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

import Foundation

extension Collection {
    public func suffix(after indexKeyPath: KeyPath<Self, Index>) -> SubSequence {
        let startIndex = self.index(after: self[keyPath: indexKeyPath])
        return self[startIndex...]
    }
    
}
