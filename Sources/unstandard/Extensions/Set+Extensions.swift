//
//  Set+Extensions.swift
//
//
//  Created by Christopher Weems on 7/1/20.
//

import Foundation

extension Set {
    @_disfavoredOverload
    public init(_ elements: Element...) {
        self = .init(elements)
    }
    
}


// MARK: - Removing all / Filtering in place

extension Set {
    public mutating func removeAll(where predicate: (Element) -> Bool) {
        self = self.filter { !predicate($0) }
    }
    
    public mutating func filterInPlace(_ isIncluded: (Element) -> Bool) {
        self = self.filter { isIncluded($0) }
    }
    
}


// MARK: - Insertion

extension Set {
    public func inserting(_ newMember: Element) -> Set {
        var new = self
        new.insert(newMember)
        return new
    }
    
}

extension Set {
    public mutating func insert<S>(contentsOf elementSequence: S) where S : Sequence, S.Element == Element {
        elementSequence.forEach {
            self.insert($0)
            
        }
        
    }
    
}


// MARK: - Array Builder Set initializer

extension Set {
    public init(@ArrayBuilder _ elements: () -> Array<Element>) {
        self = elements().asSet()
        
    }
    
}
