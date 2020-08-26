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
}
