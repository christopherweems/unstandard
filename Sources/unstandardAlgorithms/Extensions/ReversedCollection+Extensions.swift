//
//  ReversedCollection+Extensions.swift
//
//
//  Created by Christopher Weems on 9/25/21.
//

import Algorithms

extension ReversedCollection {
    public func prepend(_ element: Element) -> Chain2Sequence<[Element], Self> {
        chain([element], self)
    }
    
    public func append(_ element: Element) -> Chain2Sequence<Self, [Element]> {
        chain(self, [element])
    }
    
}
