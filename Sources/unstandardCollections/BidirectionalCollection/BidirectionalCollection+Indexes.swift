//
//  BidirectionalCollection+Indexes.swift
//  
//
//  Created by Christopher Weems on 2/2/22.
//

extension BidirectionalCollection {
    public var lastIndex: Index {
        guard !isEmpty else { return startIndex }
        return index(before: endIndex)
    }
    
}
