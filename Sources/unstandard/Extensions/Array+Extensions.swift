//
//  Array+Extensions.swift
//
//
//  Created by Christopher Weems on 5/22/17.
//

import Foundation

public extension Array {
    var indexOfLastItem: Int! {
        guard !isEmpty else { return nil }
        return count - 1
    }
    
    func contains(index: Int) -> Bool {
        return (0..<count).contains(index)
    }
}

public extension Array {
    var chooseOne: Element? {
        randomElement()
    }
    
    func choose(_ n: Int) -> [Element]? {
        guard n <= self.count else { return nil }
        return Array(shuffled().prefix(n))
    }
}


// MARK: - .at(..)

public extension Array {
    func at(_ index: Array.Index) -> Element? {
        guard (startIndex..<endIndex).contains(index) else { return nil }
        return self[index]
    }
}

public extension ArraySlice {
    func at(_ index: Index) -> Element? {
        guard index < endIndex else { return nil }
        guard startIndex <= index else { return nil }
        return self[index]
    }
}


// MARK: - Non Empty

public extension Array {
    var nonEmpty: Array? { isEmpty ? nil : self }
    
}


// MARK: - As Set

public extension Array where Element: Hashable {
    func asSet() -> Set<Element> {
        .init(self)
    }
}

public extension ArraySlice where Element : Hashable {
    func asSet() -> Set<Element> {
        .init(self)
    }
}


// MARK: - Last Index

public extension Array {
    var lastIndex: Index {
        guard !isEmpty else { return startIndex }
        return index(before: endIndex)
    }
}

public extension ArraySlice {
    var lastIndex: Index {
        guard !isEmpty else { return startIndex }
        return index(before: endIndex)
    }
}


// MARK: - Intereleave

public extension Array {
    func interleave(_ element: Element) -> Self {
        self.map { [$0, element] }
            .flatMap { $0 }
            .dropLast()
            .wrap { Array($0) }
    }

}


// MARK: - Removing Duplicates

public extension Array where Element : Hashable {
    
    /// Returns all unique (by hash value) elements in the array.
    /// In the case of a collision, only the lower indexed item is returned.
    ///
    /// - Returns: Filtered array of unique.
    ///
    /// - Complexity: O(n) where n == number of elements in array.
    func removingDuplicates() -> Self {
        var seen = Set<Element>()
        
        return self.compactMap { proposedElement in
            guard !seen.contains(proposedElement) else { return nil }
            seen.insert(proposedElement)
            return proposedElement
        }
    }
    
}


// MARK: - Splitting into groups

public enum CollectionSplittingStrategy: Equatable {
    case fillBackward
    // ^^ Array of 42 elements split by 20: [20], [20], [2]
    
    indirect case evenly(fallback: CollectionSplittingStrategy)
    // ^^ Array of 63 elements split by 20 with fill backward fallback: [16, 16, 16, 15]
    //    evenly case as a fallback is a programming error
    
}


public extension Array {
    func split(intoGroupsOf maxCountPerBucket: Int, splittingStrategy: CollectionSplittingStrategy = .fillBackward) -> Array<[Element]> {
        assert(splittingStrategy == .fillBackward, "Only .fillBackward strategy implemented")
        
        var containers = Array<[Element]>()
        
        var elementCountInThisBucket = 0
        
        self.forEach {
            if maxCountPerBucket == elementCountInThisBucket {
                elementCountInThisBucket = 0
            }
            
            if elementCountInThisBucket == 0 {
                containers.append([Element]())
            }
            
            var last = containers.popLast()!
            last.append($0)
            
            elementCountInThisBucket += 1
            containers.append(last)
            
        }
        
        return containers
    }
}

// MARK: - Appending elements

public extension Array {
    func appending(@ProtocolTypedArrayBuilder<Element> _ elements: () -> [Element]) -> Self {
        var new = self
        new += elements()
        return new
    }
    
    mutating func append(@ProtocolTypedArrayBuilder<Element> _ elements: () -> Self) {
        self.append(contentsOf: elements())
    }
    
}



// MARK: - Count of elements matching predicate

public extension Array {
    /// [3, 0, -5].count(\.isZero) == 1
    func count(_ predicate: (Element) -> Bool) -> Int {
        self.filter(predicate)
            .count
    }
    
}


// MARK: - Function Builder initializers

public extension Array {
    init(@ArrayBuilder _ builder: () -> Self) {
        self = builder()
    }
    
}

