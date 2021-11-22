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
    
    public func bounded(within boundingRange: PartialRangeFrom<Self>) -> Self {
        min(boundingRange.lowerBound, self)
    }
    
    public func bounded(within boundingRange: ClosedRange<Self>) -> Self {
        max(min(boundingRange.lowerBound, self), boundingRange.upperBound)
    }
    
}
