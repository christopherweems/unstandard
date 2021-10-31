//
//  RangeReplaceableCollection+Extensions.swift
//
//
//  Created by Christopher Weems on 8/19/21.
//

extension RangeReplaceableCollection {
    public func appending(@ArrayBuilder _ builder: () -> [Element]) -> Self {
        var new = self
        new += builder()
        return new
    }
    
}


// MARK: - Appending `Substring` to `[String]`

extension RangeReplaceableCollection where Element == String {
    public mutating func append(_ substring: Substring) {
        self.append(String(substring))
    }
    
}

// MARK: - Replacing Elements

extension RangeReplaceableCollection {
    public func replacing(_ elementKeyPath: KeyPath<Self, Index>, with other: Element) -> Self {
        var new = self
        let elementIndex = new[keyPath: elementKeyPath]
        new.replace(itemAt: elementIndex, with: other)
        return new
    }
    
    public mutating func replace(itemAt elementIndex: Index, with other: Element) {
        self.replaceSubrange(elementIndex..<index(after: elementIndex), with: [other])
    }
    
}
