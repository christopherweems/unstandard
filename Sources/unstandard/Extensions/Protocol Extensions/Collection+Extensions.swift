//
//  Collection+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/10/19.
//

import Foundation

public extension Collection {
    @inlinable func _first(whereOptionalIsTrue predicate: (Element) throws -> Bool?) rethrows -> Element? {
        try self.first(where: { try predicate($0) == true })
    }
    
}

public extension Collection {
    func _compactMap<ElementOfResult>(discardThrowing transform: (Element) throws -> ElementOfResult?) -> [ElementOfResult] {
        self.compactMap {
            try? transform($0)
        }
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


// MARK: .divide(..)

public extension Collection {
    func divide(on keyPath: KeyPath<Element, Bool>) -> [Array<Element>] {
        var trueContent = [Element]()
        var falseContent = [Element]()
        
        self.forEach {
            if $0[keyPath: keyPath] {
                trueContent.append($0)
                
            } else {
                falseContent.append($0)
                
            }
        }
        
        return [trueContent, falseContent]
    }
    
    @available(*, deprecated)
    func split(on keyPath: KeyPath<Element, Bool>) -> [Array<Element>] {
        divide(on: keyPath)
    }
    
}


// MARK: - Removing Duplicates

public extension Collection where Element: Hashable {
    private typealias HashValue = Int
    
    func removingDuplicates() -> [Element] {
        var seen = Set<HashValue>()
        
        return compactMap { element in
            let hashValue = element.hashValue
            guard !seen.contains(hashValue) else { return nil }
            seen.insert(hashValue)
            return element
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


// MARK: - Collection.split(after:)

public extension Collection {
    func split(after elementTerminatesGroup: (Element) -> Bool) -> [ArraySlice<Self.Element>] {
        let allElements = Array(self)
        var groupRanges = [Range<Int>]()
        
        var currentRange: Range<Int> = Range(uncheckedBounds: (lower: allElements.startIndex, upper: allElements.startIndex))
        
        self.forEach {
            currentRange = Range(uncheckedBounds: (lower: currentRange.lowerBound, upper: currentRange.upperBound + 1))
            
            if elementTerminatesGroup($0) {
                groupRanges.append(currentRange)
                currentRange = Range(uncheckedBounds: (lower: currentRange.upperBound, upper: currentRange.upperBound))
                
            }
        }
        
        groupRanges.append(currentRange)
        
        return groupRanges
            .map { allElements[$0] }
            .filter { !$0.isEmpty }
    }
    
}

// MARK: - Is

public extension Collection {
    func `is`(where predicate: (Self) -> Bool) -> Bool {
        predicate(self)
    }
    
}


// MARK: - Has Elements

public extension Collection {
    var hasElements: Bool {
        !isEmpty
    }
    
}


// MARK: - Last Element Index

public extension BidirectionalCollection {
    var lastElementIndex: Index {
        index(before: endIndex)
    }
    
}



// MARK: - `Collection.sorted(on:)`

public extension Collection {
    func sorted<V: Comparable>(on keyPath: KeyPath<Element, V>,
                               comparison: (V, V) -> Bool = { $0 < $1 }) -> [Element] {
        self.sorted { comparison($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
}
