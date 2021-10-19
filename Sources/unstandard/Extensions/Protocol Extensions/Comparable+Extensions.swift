//
//  Comparable.swift
//
//
//  Created by Christopher Weems on 10/19/21.
//

extension Comparable {
    public func bounded(within boundingRange: PartialRangeThrough<Self>) -> Self {
        min(self, boundingRange.upperBound)
    }
    
}
