//
//  Array+Extensions.swift
//
//
//  Created by Christopher Weems on 5/22/17.
//

import Algorithms
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


// MARK: - Flatten

extension Array {
    public static func flatten(@ProtocolTypedArrayBuilder<[Element]> contents: () -> Array<[Element]>) -> [Element] {
        contents().flatMap { $0 }
    }
    
    @available(*, deprecated, renamed: "flatten")
    public static func flatMap(@ProtocolTypedArrayBuilder<[Element]> _ contents: () -> Array<[Element]>) -> [Element] {
        self.flatten(contents: contents)
    }
    
}


// MARK: - Compact Map

extension Array {
    public static func compact(@ProtocolTypedArrayBuilder<Element?> _ contents: () -> Array<Element?>) -> [Element] {
        contents().compactMap { $0 }
    }
    
}


// MARK: - Intereleave

extension Array {
    @available(*, deprecated, message: "Use `.interspersed(with:)` from `swift-algorithms`")
    public func interleave(_ element: Element) -> Self {
        Array(self.interspersed(with: element))
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
    @available(*, deprecated, message: "Use `.uniqued()` from `swift-algorithms`")
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
    public init(@ProtocolTypedArrayBuilder<Element> _ elements: () -> Self) {
        self = elements()
    }
    
}

extension Array {
    public init(type: Element.Type, @ProtocolTypedArrayBuilder<Element> contents: () -> Self) {
        self = contents()
        
    }
    
}

// MARK: - As Tuple

extension Array {
    internal typealias Tuple16 = (
        Element, Element, Element, Element,
        Element, Element, Element, Element,
        Element, Element, Element, Element,
        Element, Element, Element, Element
    )
    
    internal func asTuple16() -> Tuple16 {
        precondition(count == 16)
        return (
            self[0], self[1], self[2], self[3],
            self[4], self[5], self[6], self[7],
            self[8], self[9], self[10], self[11],
            self[12], self[13], self[14], self[15]
        )
    }
    
}
