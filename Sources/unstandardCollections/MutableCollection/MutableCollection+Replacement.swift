//
//  MutableCollection+Replacement.swift
//  
//
//  Created by Christopher Weems on 11/4/21.
//

extension MutableCollection {
    public mutating func replace(at itemKeyPath: KeyPath<Self, Index>, with replacement: Element) {
        let itemIndex = self[keyPath: itemKeyPath]
        self[itemIndex] = replacement
    }
    
    public mutating func replaceSubrange<R>(_ subrangeKeyPath: KeyPath<Self, Range<Index>>, with replacement: R)
    where R == Self.SubSequence {
        let subrangeElementIndices = self[keyPath: subrangeKeyPath]
        self[subrangeElementIndices] = replacement
    }
    
    public mutating func replaceSubrange(_ subrangeKeyPath: KeyPath<Self, Range<Index>>,
                                         transform: (Element) -> Element)
    where Index : Strideable, Index.Stride : SignedInteger {
        let subrangeElementIndices = self[keyPath: subrangeKeyPath]
        
        subrangeElementIndices.forEach { index in
            let element = self[index]
            self[index] = transform(element)
        }
        
    }
    
}
