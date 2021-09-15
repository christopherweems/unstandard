//
//  BinaryInteger+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/2/20.
//

import Foundation

public extension BinaryInteger {
    func bounded(within range: ClosedRange<Self>) -> Self {
        switch self {
        case (...range.lowerBound):
            return range.lowerBound
            
        case (range.upperBound...):
            return range.upperBound
            
        default:
            return self
        }
    }
    
    mutating func bound(within range: ClosedRange<Self>) {
        self = self.bounded(within: range)
        
    }
    
}

public extension BinaryInteger {
    func isBounded(within range: ClosedRange<Self>) -> Bool {
        range.contains(self)
    }
    
    func isBounded(within range: Range<Self>) -> Bool {
        range.contains(self)
    }
    
}
