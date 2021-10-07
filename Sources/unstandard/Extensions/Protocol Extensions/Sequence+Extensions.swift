//
//  Sequence+Extensions.swift
//
//
//  Created by Christopher Weems on 8/25/19.
//

extension Sequence {
    public func mapFirst<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> ElementOfResult? {
        for element in self {
            guard let mapped = try transform(element) else { continue }
            return mapped
        }
        
        return nil
    }
    
    public func mapLast<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> ElementOfResult? {
        for element in self.reversed() {
            guard let mapped = try transform(element) else { continue }
            return mapped
        }
        
        return nil
    }
    
}


// MARK: - Stable Sort

extension Sequence {
    public func stableSorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element] {
        try enumerated()
            .sorted { a, b -> Bool in
                try areInIncreasingOrder(a.element, b.element) ||
                    (a.offset < b.offset && !areInIncreasingOrder(b.element, a.element))
            }
            .map { $0.element }
    }
    
}

extension Sequence where Element : Comparable {
    public func stableSorted() -> [Element] {
        self.stableSorted(by: { $0 < $1 })
    }
    
}


// MARK: - Compacted Map

extension Sequence {
    public func compactedMap<E, Result>(_ transform: (E) -> Result) -> [Result] where Element == Optional<E> {
        self.compactMap {
            guard let wrapped = $0 else { return nil }
            return transform(wrapped)
        }
    }
    
}


// MARK: -  Compact Filter

extension Sequence {
    public func compactFilter(_ isIncluded: (Element) -> Bool?) -> [Element] {
        self.filter { isIncluded($0) == true }
    }
    
}


// MARK: - Dividing into buckets

extension Sequence {
    // TODO: Find equivalent method in `swift-algorithms`
    /// bucket[last].count <= itemsPerBucket
    public func bucket(itemsPerBucket: Int) -> [ArraySlice<Element>] {
        var all = [ArraySlice<Element>]()
        
        let elements = Array(self)
        
        let totalCount = elements.count
        var startIndex = 0
        
        while startIndex < totalCount {
            let endIndex = Swift.min(startIndex + itemsPerBucket, totalCount)
            all.append(elements[startIndex..<endIndex])
            startIndex = endIndex
            
        }
        
        return all
    }
    
}


// MARK: - Replacing occurrences of elements

extension Sequence where Element: Hashable {
    public func replacingOccurrences(of matches: Element..., with pattern: Element) -> [Element] {
        let matches = Set(matches)
        return self.map { matches.contains($0) ? pattern : $0 }
    }
    
}

extension Sequence where Element: Equatable {
    public func replacingOccurrences(of match: Element, with pattern: Element) -> [Element] {
        self.map { match == $0 ? pattern : $0 }
    }
    
}
