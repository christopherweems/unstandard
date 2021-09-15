//
//  Collection+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/10/19.
//

import Algorithms
import Foundation

extension Collection {
    @inlinable
    public func _first(whereOptionalIsTrue predicate: (Element) throws -> Bool?) rethrows -> Element? {
        try self.first(where: { try predicate($0) == true })
    }
    
}

extension Collection {
    public func _compactMap<ElementOfResult>(discardThrowing transform: (Element) throws -> ElementOfResult?) -> [ElementOfResult] {
        self.compactMap {
            try? transform($0)
        }
    }
    
}


extension Collection {
    /// usage: `foo._forEach(adjacentPair: { preceding, succeeding in ... })`
    @available(*, deprecated, message: "Use `.adjacentPairs().forEach { .. } instead`")
    public func _forEach(adjacentPair pairBody: (Element, Element) -> Void) {
        self.adjacentPairs().forEach(pairBody)
        
    }
    
}


// MARK: .divide(..)

extension Collection {
    public func divide(on keyPath: KeyPath<Element, Bool>) -> [Array<Element>] {
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
    
    @available(*, deprecated, renamed: "divide(on:)")
    public func split(on keyPath: KeyPath<Element, Bool>) -> [Array<Element>] {
        divide(on: keyPath)
    }
    
}


// MARK: - Removing Duplicates

extension Collection where Element: Hashable {
    @available(*, deprecated, message: "Use `Collection.uniqued()` instead")
    public func removingDuplicates() -> [Element] {
        Array(uniqued())
    }
    
}


// MARK: - Union

extension Collection where Element : OptionSet {
    public func union() -> Element {
        var new = Element()
        self.forEach { new.formUnion($0) }
        return new
    }
    
}


// MARK: - Not Empty

extension Collection {
    public var notEmpty: Self? {
        isEmpty ? nil : self
    }
    
}

extension Optional where Wrapped: Collection {
    public var notEmpty: Wrapped? {
        self?.notEmpty
    }
    
}



// MARK: - Is Empty

extension Optional where Wrapped : Collection {
    public var isEmpty: Bool {
        self?.isEmpty ?? true
    }
    
}

extension Collection {
    public func count(where isIncluded: (Element) -> Bool) -> Int {
        self.filter(isIncluded).count
    }
    
}


// MARK: - Collection.IndexPosition

public enum CollectionIndexPosition {
    case endIndex
    
}

extension Collection {
    public typealias IndexPosition = CollectionIndexPosition
    
    public func index(at indexPosition: IndexPosition) -> Index {
        switch indexPosition {
        case .endIndex:
            return endIndex
            
        }
    }
    
}

extension Collection {
    public func range(at position: IndexPosition) -> Range<Index> {
        switch position {
        case .endIndex:
            return self.endIndex..<self.endIndex
            
        }
    }
    
}


// MARK: - Collection.split(after:)

extension Collection {
    public func split(after elementTerminatesGroup: (Element) -> Bool) -> [ArraySlice<Self.Element>] {
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

extension Collection {
    public func `is`(where predicate: (Self) -> Bool) -> Bool {
        predicate(self)
    }
    
}


// MARK: - Has Elements

extension Collection {
    public var hasElements: Bool {
        !isEmpty
    }
    
}


// MARK: - Contains Single Element

extension Collection {
    public var containsSingleElement: Bool {
        index(after: startIndex) == endIndex
    }
    
}


// MARK: - Last Element Index

extension BidirectionalCollection {
    public var lastElementIndex: Index {
        index(before: endIndex)
    }
    
}


// MARK: - `Collection.firstIndex(after:)`

extension Collection {
    public func firstIndex(after element: Element) -> Index? where Element: Equatable {
        guard let index = firstIndex(of: element) else { return nil }
        let idx = self.index(after: index)
        
        guard idx != self.endIndex else { return nil }
        return idx
    }
    
}



// MARK: - `Collection.sorted(on:)`

extension Collection {
    public func sorted<V: Comparable>(on keyPath: KeyPath<Element, V>,
                                      comparison: (V, V) -> Bool = { $0 < $1 }) -> [Element] {
        self.sorted { comparison($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
}


// MARK: - `Collection.allUnique(on:)`

extension Collection {
    public func allUnique<Value>(on valueKeyPath: KeyPath<Element, Value>) -> Bool where Value : Hashable {
        // TODO: reimplement with a more efficient early-breaking loop
        let uniqued = self.uniqued { $0[keyPath: valueKeyPath] }
        return self.elementsEqual(uniqued) { $0[keyPath: valueKeyPath] == $1[keyPath: valueKeyPath] }
    }
    
}


// MARK: - As Dictionary

extension Collection {
    public func asDictionary<UniqueKey, Value>() -> [UniqueKey: Value] where Element == (UniqueKey, Value) {
        Dictionary(uniqueKeysWithValues: self)
    }
    
}


// MARK: -

extension Collection {
    public func asArray() -> Array<Element> {
        .init(self)
    }
    
}


// MARK: -

extension Collection {
    // returns nil if collection contains zero or more than one element
    public var onlyElement: Element? {
        guard hasOneElement else { return nil }
        return self[startIndex]
    }
    
    public var hasOneElement: Bool {
        !isEmpty && index(after: startIndex) == endIndex
    }
    
}
