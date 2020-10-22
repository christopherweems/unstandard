//
//  Set+Extensions.swift
//
//
//  Created by Christopher Weems on 7/1/20.
//

import Foundation

/*
public extension Set {
    init(_ elements: Element...) {
        self = .init(elements)
    }
}
*/


// MARK: - Removing all / Filtering in place

public extension Set {
    mutating func removeAll(where predicate: (Element) -> Bool) {
        self = self.filter { !predicate($0) }
    }
    
    mutating func filterInPlace(_ isIncluded: (Element) -> Bool) {
        self = self.filter { isIncluded($0) }
    }
    
}


// MARK: - Insertion

public extension Set {
    func inserting(_ newMember: Element) -> Set {
        var new = self
        new.insert(newMember)
        return new
    }
}


// MARK: - Array Builder Set initializer

public extension Set {
    init(@ArrayBuilder _ elements: () -> Array<Element>) {
        self = elements().asSet()
    }
    
}
