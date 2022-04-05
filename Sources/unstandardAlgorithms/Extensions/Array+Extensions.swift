//
//  Array+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/11/21.
//

import Algorithms

// MARK: - Combining two sequences

extension Array {
    public init<S1, S2>(_ head: S1, _ tail: S2) where S1 : Sequence, S2 : Sequence, S1.Element == Self.Element, S1.Element == S2.Element {
        let contents = chain(head, tail)
        self.init(contents)
    }
    
    public init<Tail>(_ head: Element, _ tail: Tail) where Tail : Sequence, Tail.Element == Element {
        let contents = chain([head], tail)
        self.init(contents)
    }
    
}
