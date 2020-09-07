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
    /// usage: `foo._forEach(adjacentPair: { preceding, succeeding in ... })`
    func _forEach(adjacentPair pairBody: (Element, Element) -> Void) {
        var lastIndex = startIndex
        
        while true {
            let next = self.index(after: lastIndex)
            guard next != endIndex else { break }
            pairBody(self[lastIndex], self[next])
            lastIndex = next
            
        }
        
    }

}



// MARK: - Not Empty

public extension Collection {
    var notEmpty: Self? {
        isEmpty ? nil : self
    }
    
}

public extension Optional where Wrapped: Collection {
    var notEmpty: Wrapped? {
        self?.notEmpty
    }
    
}



// MARK: - Is Empty

public extension Optional where Wrapped : Collection {
    var isEmpty: Bool {
        self?.isEmpty ?? true
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

public extension Collection {
    func range(at position: IndexPosition) -> Range<Index> {
        switch position {
        case .endIndex:
            return self.endIndex..<self.endIndex
            
        }
    }
}
