//
//  Collection+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/10/19.
//

import Foundation

public extension Collection {
    @inlinable func first(whereOptionalIsTrue predicate: (Element) throws -> Bool?) rethrows -> Element? {
        try self.first(where: { try predicate($0) == true })
    }
}

public extension Collection {
    /// usage: `foo.forEach(adjacentPair: { preceding, succeeding in ... })`
    ///        `notCalled` parameter makes parameter label `adjacentPair` necessary
    
    func forEach(adjacentPair pairBody: (Element, Element) -> Void, notCalled: (() -> Void) = { }) {
        var lastIndex = startIndex
        
        while true {
            let next = self.index(after: lastIndex)
            guard next != endIndex else { break }
            pairBody(self[lastIndex], self[next])
            lastIndex = next
            
        }
        
    }
}


public extension Collection {
    var notEmpty: Self? {
        isEmpty ? nil : self
    }
    
}


// MARK: - Collection.IndexPosition

public enum CollectionIndexPosition {
    case endIndex
    
}

public extension Collection {
    typealias IndexPosition = CollectionIndexPosition
    
    func index(at indexPosition: IndexPosition) -> Index {
        switch indexPosition {
        case .endIndex:
            return endIndex
            
        }
    }
}
