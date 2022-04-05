//
//  Collection+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/11/21.
//

import Algorithms


// MARK: -

extension Collection {
    public func appending<Tail>(_ tail: () -> Tail) -> Chain2Sequence<Self, Tail>
    where Tail : Collection, Tail.Element == Element {
        return chain(self, tail())
    }
    
}


// MARK: - Collection head/tail map

extension Collection {
    // use a different transform for the first element vs the remaining elements
    public func map<T>(head headTransform: (Element) -> T, tail tailTransform: (Element) -> T) -> [T] {
        guard !isEmpty else { return [] }
        return .init([first!].map(headTransform), dropFirst().map(tailTransform))
    }
    
}


// MARK: - `Collection.indexed(offset:)`

extension Collection where Index == Int {
    public func indexed(offset: Index) -> AnySequence<(Index, Element)> {
        AnySequence(self.indexed().lazy.map { ($0.index + offset, $0.element) })
    }
    
}

// MARK: - `Collection.collecting(..)`

extension Collection {
    public func collect() -> Set<Element> where Element : Hashable {
        var collectedElements = Set<Element>()
        
        self.forEach {
            collectedElements.insert($0)
        }
        
        return collectedElements
    }
    
    public func collect<Property>(
        _ property: (Element) -> Property
    ) -> Set<Property> where Property : Hashable {
        self.map(property).collect()
    }
    
}


// MARK: -

extension Sequence {
    // Transform contents of each nested array
    public func mapContents<InnerElement, InnerResult>(
        _ transform: (InnerElement) -> InnerResult) -> [[InnerResult]]
    where Element == [InnerElement] {
        self.map { $0.map(transform) }
    }
    
}

extension Collection {
    // the difference between the max and min values of a projection on elements of this collection
    // as such this value is always positive
    public func difference<V>(on predicate: (Element) throws -> V) rethrows -> V? where V : AdditiveArithmetic, V : Comparable {
        guard let max = try self.max(on: predicate) else { return nil }
        guard let min = try self.min(on: predicate) else { return nil }
        return try predicate(max) - predicate(min)
    }
    
}


// MARK: -

extension Collection {
    @_disfavoredOverload
    public func forEach(inlineMutable body: (inout Element) -> Void) {
        self.forEach {
            var element = $0
            body(&element)
        }
    }
    
}
