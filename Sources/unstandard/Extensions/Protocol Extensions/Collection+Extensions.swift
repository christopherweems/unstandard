//
//  Collection+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/10/19.
//

import Foundation
import Algorithms

extension Collection {
    @inlinable
    public func _first(whereOptionalIsTrue predicate: (Element) throws -> Bool?) rethrows -> Element? {
        try self.first(where: { try predicate($0) == true })
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
    public func divide(on belongsInFirstGroup: (Element) -> Bool) -> [Array<Element>] {
        var trueContent = [Element]()
        var falseContent = [Element]()
        
        self.forEach {
            if belongsInFirstGroup($0) {
                trueContent.append($0)
                
            } else {
                falseContent.append($0)
                
            }
        }
        
        return [trueContent, falseContent]
    }
    
    @available(*, deprecated, renamed: "divide(on:)")
    public func split(on keyPath: KeyPath<Element, Bool>) -> [Array<Element>] {
        divide(on: { $0[keyPath: keyPath] })
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


// MARK: - Non Empty

extension Collection {
    public var nonEmpty: Self? {
        isEmpty ? nil : self
    }
    
    // TODO: better expressed as `.flatNonEmpty`
    public func flatNonEmpty<T>() -> [T]? where Element == Optional<T> {
        self.compacted()
            .asArray()
            .nonEmpty
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


// MARK: - .contains(optional:)


extension Collection where Element : Equatable {
    public func contains(optional element: Optional<Element>) -> Bool {
        guard let element = element else { return false }
        return self.contains(element)
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


// MARK: - Higher Order Functions on String collections

extension Collection where Element : StringProtocol {
    public func map(trimmingCharactersIn trimmingSet: CharacterSet) -> [String] {
        self.map { $0.trimmingCharacters(in: trimmingSet) }
    }
    
    public func flatMap<S, E>(componentsSeparatedBy seperator: S, transform: ([String]) throws -> [E]) rethrows -> [E] where S : StringProtocol {
        try self.flatMap { p -> [E] in
            let components = p.components(separatedBy: seperator)
            return try transform(components)
        }
    }
    
}





// MARK: - `Collection.suffix(after:)` for StringProtocol

extension Collection where SubSequence : StringProtocol {
    public func suffix(after index: Self.Index) -> SubSequence {
        guard index != endIndex else { return "" }
        let startIndex = self.index(after: index)
        return self[startIndex...]
    }
    
}


extension Collection where SubSequence == String.UnicodeScalarView.SubSequence {
    public func suffix(after index: Self.Index) -> SubSequence {
        guard index != endIndex else { return "".unicodeScalars[...] }
        let startIndex = self.index(after: index)
        return self[startIndex...]
    }
    
}


// MARK: - Inverting ranges in a collection

extension Collection {
    /// Inverts a collection of ranges such that the result is all ranges
    /// covering elements in `base` that the original collection did not cover.
    ///
    /// ```swift
    /// let coinTosses = [true, false, false, false]
    /// let firstTwo = [(0..<coinTosses.index(coinTosses.startIndex, offsetBy: 2))]
    /// let remainingTosses = firstTwo.inverted(in: coinTosses)
    /// ```
    public func inverted<Base>(in base: Base) -> [Element]
    where Base : Collection, Element == Range<Base.Index>, Base.Index : Hashable {
        var nonInverted = Set(self)
        nonInverted.insert((base.startIndex..<base.startIndex))
        nonInverted.insert((base.endIndex..<base.endIndex))
        
        return nonInverted
            .sorted(on: \.lowerBound)
            .adjacentPairs()
            .map { ($0.upperBound..<$1.lowerBound) }
    }
    
}


// MARK: - Merging ranges that overlap

extension Collection {
    /// Merges overlapping ranges into ranges containing the entirety of the two ranges
    ///
    /// O(n^2)
    public func mergingOverlappingRanges<Index>(mergeAdjoiningRanges: Bool = false) -> Set<Element>
    where Element == Range<Index>, Index : Hashable {
        precondition(!mergeAdjoiningRanges, "Missing implementation")
        
        return self.reduce([]) { (partialResult: Set<Element>, range: Element) in
                let overlaps = partialResult.filter { $0.overlaps(range) }
                
                if overlaps.isEmpty {
                    return partialResult.inserting(range)
                    
                } else {
                    let partialResultWithoutOverlaps = partialResult.subtracting(overlaps)
                    
                    let mergedOverlap = overlaps.reduce(into: overlaps.first!) { overlap, range in
                        if range.lowerBound < overlap.lowerBound {
                            overlap = range.lowerBound..<overlap.upperBound
                        }
                        
                        if overlap.upperBound < range.upperBound {
                            overlap = overlap.lowerBound..<range.upperBound
                        }
                        
                    }
                    
                    return partialResultWithoutOverlaps.inserting(mergedOverlap)
                }
                
            }
    }
    
}
    
