//
//  FixedWidthInteger+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/2/20.
//

import Foundation

extension FixedWidthInteger {
    public func bounded(within range: PartialRangeFrom<Self>) -> Self {
        self.bounded(within: range.lowerBound...(.max))
    }
    
    public mutating func bound(within range: PartialRangeFrom<Self>) {
        self.bound(within: range.lowerBound...(.max))
    }
    
}

extension FixedWidthInteger {
    /*
     2.bounded(within: ..<4) == 2
     4.bounded(within: ..<4) == 3
     */
    public func bounded(within range: PartialRangeUpTo<Self>) -> Self {
        self.bounded(within: (.min)...(range.upperBound - 1))
    }
    
    public mutating func bound(within range: PartialRangeUpTo<Self>) {
        self.bound(within: (.min)...(range.upperBound - 1))
    }
    
}

extension FixedWidthInteger {
    public func asDouble() -> Double {
        .init(self)
    }
    
}
