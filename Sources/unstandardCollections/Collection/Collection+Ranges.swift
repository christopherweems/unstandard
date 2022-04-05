//
//  Collection+Ranges.swift
//  
//
//  Created by Christopher Weems on 11/4/21.
//

extension Collection {
    public var tailRange: Range<Index> {
        suffixRange(after: startIndex)
    }
    
}

extension Collection {
    public func suffixRange(after index: Index) -> Range<Index> {
        guard index < endIndex else { preconditionFailure() }
        let startIndex = self.index(after: index)
        return startIndex..<endIndex
    }
    
}
