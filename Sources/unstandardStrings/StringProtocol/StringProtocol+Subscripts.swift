//
//  StringProtocol+Subscripts.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

extension StringProtocol where SubSequence == Substring {
    public subscript(rangeKeyPath: KeyPath<Self, Range<Self.Index>>) -> SubSequence {
        let range = self[keyPath: rangeKeyPath]
        return self[range]
    }
    
    public subscript(after indexKeyPath: KeyPath<Self, Self.Index>) -> SubSequence {
        let startIndex = self.index(after: self[keyPath: indexKeyPath])
        return self[startIndex...]
    }
    
    public subscript(after index: Self.Index) -> SubSequence {
        let startIndex = self.index(after: index)
        return self[startIndex...]
    }
    
}
