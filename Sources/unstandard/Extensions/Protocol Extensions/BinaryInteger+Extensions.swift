//
//  BinaryInteger+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/2/20.
//

import Foundation

extension BinaryInteger {
    public func bounded(within range: ClosedRange<Self>) -> Self {
        switch self {
        case (...range.lowerBound):
            return range.lowerBound
            
        case (range.upperBound...):
            return range.upperBound
            
        default:
            return self
        }
    }
    
    public mutating func bound(within range: ClosedRange<Self>) {
        self = self.bounded(within: range)
        
    }
    
}

extension BinaryInteger {
    public func isBounded(within range: ClosedRange<Self>) -> Bool {
        range.contains(self)
    }
    
    public func isBounded(within range: Range<Self>) -> Bool {
        range.contains(self)
    }
    
}
