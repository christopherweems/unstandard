//
//  Array+Extensions.swift
//
//
//  Created by Christopher Weems on 5/22/17.
//

import Foundation

extension Array {
    public var indexOfLastItem: Int! {
        guard !isEmpty else { return nil }
        return count - 1
    }
    
    public func contains(index: Int) -> Bool {
        return (0..<count).contains(index)
    }
    
}

extension Array {
    public subscript(after elementIndex: Index) -> Element {
        self[self.index(after: elementIndex)]
    }
    
}

extension Array {
    public var chooseOne: Element? {
        randomElement()
    }
    
    public func choose(_ n: Int) -> [Element]? {
        guard n <= self.count else { return nil }
        return Array(shuffled().prefix(n))
    }
}


// MARK: - .at(..)

extension Array {
    public func at(_ index: Array.Index) -> Element? {
        guard (startIndex..<endIndex).contains(index) else { return nil }
        return self[index]
    }
    
}

extension ArraySlice {
    public func at(_ index: Index) -> Element? {
        guard index < endIndex else { return nil }
        guard startIndex <= index else { return nil }
        return self[index]
    }
    
}


// MARK: -

extension Array {
    public subscript(_ index: Index, defaultValue defaultValue: @autoclosure () -> Element) -> Element {
        self.at(index) ?? defaultValue()
    }
    
}


// MARK: - Non Empty

extension Array {
    public var nonEmpty: Array? { isEmpty ? nil : self }
    
}


// MARK: - As Set

extension Array where Element: Hashable {
    public func asSet() -> Set<Element> {
        .init(self)
    }
    
}

extension ArraySlice where Element : Hashable {
    public func asSet() -> Set<Element> {
        .init(self)
    }
    
}


// MARK: - Last Index

extension Array {
    public var lastIndex: Index {
        guard !isEmpty else { return startIndex }
        return index(before: endIndex)
    }
    
}

extension ArraySlice {
    public var lastIndex: Index {
        guard !isEmpty else { return startIndex }
        return index(before: endIndex)
    }
    
}


// MARK: - Flatten

extension Array {
    public static func flatten(@SimpleArrayBuilder<[Element]> contents: () -> Array<[Element]>) -> [Element] {
        contents().flatMap { $0 }
    }
    
    @available(*, deprecated, renamed: "flatten")
    public static func flatMap(@SimpleArrayBuilder<[Element]> _ contents: () -> Array<[Element]>) -> [Element] {
        self.flatten(contents: contents)
    }
    
}


// MARK: - Compact Map

extension Array {
    public static func compact(@SimpleArrayBuilder<Element?> _ contents: () -> Array<Element?>) -> [Element] {
        contents().compactMap { $0 }
    }
    
}


// MARK: - Intereleave

extension Array {
    public func interleave(_ element: Element) -> Self {
        self.map { [$0, element] }
            .flatMap { $0 }
            .dropLast()
            .wrap { Array($0) }
    }

}


// MARK: - Removing Duplicates

extension Array where Element : Hashable {
    
    /// Returns all unique (by hash value) elements in the array.
    /// In the case of a collision, only the lower indexed item is returned.
    ///
    /// - Returns: Filtered array of unique.
    ///
    /// - Complexity: O(n) where n == number of elements in array.
    public func removingDuplicates() -> Self {
        var seen = Set<Element>()
        
        return self.compactMap { proposedElement in
            guard !seen.contains(proposedElement) else { return nil }
            seen.insert(proposedElement)
            return proposedElement
        }
    }
    
}

// MAKR: - Duplicate Checking

extension Array where Element : Hashable {
    public var containsDuplicates: Bool {
        var seen = Set<Element>()
        
        return !self.allSatisfy {
            let hasSeen = seen.contains($0)
            seen.insert($0)
            return !hasSeen
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


extension Array {
    public func split(intoGroupsOf maxCountPerBucket: Int, splittingStrategy: CollectionSplittingStrategy = .fillBackward) -> Array<[Element]> {
        Swift.assert(splittingStrategy == .fillBackward, "Only .fillBackward strategy implemented")
        
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

extension Array {
    public func appending(@ProtocolTypedArrayBuilder<Element> _ elements: () -> [Element]) -> Self {
        var new = self
        new += elements()
        return new
    }
    
    public mutating func append(@ProtocolTypedArrayBuilder<Element> _ elements: () -> Self) {
        self.append(contentsOf: elements())
    }
    
}



// MARK: - Count of elements matching predicate

extension Array {
    /// [3, 0, -5].count(\.isZero) == 1
    public func count(_ predicate: (Element) -> Bool) -> Int {
        self.filter(predicate)
            .count
    }
    
}


// MARK: - Function Builder initializers

extension Array {
    public init(@ArrayBuilder _ builder: () -> Self) {
        self = builder()
    }
    
}

extension Array {
    public init(type: Element.Type, @ProtocolTypedArrayBuilder<Element> contents: () -> Self) {
        self = contents()
        
    }
    
}
