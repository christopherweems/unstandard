//
//  Collection+SubSequence.swift
//  
//
//  Created by Christopher Weems on 11/4/21.
//

import Foundation

extension Collection {
    public subscript(rangeKeyPath: KeyPath<Self, Range<Index>>) -> SubSequence {
        let range = self[keyPath: rangeKeyPath]
        return self[range]
    }
    
}
