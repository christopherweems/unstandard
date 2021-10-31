//
//  String.UnicodeScalarView+Ranges.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import Foundation

extension String.UnicodeScalarView {
    public var fullRange: Range<Self.Index> {
        self.startIndex..<self.endIndex
    }
    
}

extension String.UnicodeScalarView {
    public subscript(rangeKeyPath: KeyPath<Self, Range<Index>>) -> SubSequence {
        let range = self[keyPath: rangeKeyPath]
        return self[range]
    }
    
}
