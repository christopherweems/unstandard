//
//  FixedWidthInteger+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/2/20.
//

import Foundation

public extension FixedWidthInteger {
    func bounded(within range: PartialRangeFrom<Self>) -> Self {
        self.bounded(within: range.lowerBound...(.max))
    }
    
    mutating func bound(within range: PartialRangeFrom<Self>) {
        self.bound(within: range.lowerBound...(.max))
    }
    
}

public extension FixedWidthInteger {
    /*
     2.bounded(within: ..<4) == 2
     4.bounded(within: ..<4) == 3
     */
    func bounded(within range: PartialRangeUpTo<Self>) -> Self {
        self.bounded(within: (.min)...(range.upperBound - 1))
    }
    
    mutating func bound(within range: PartialRangeUpTo<Self>) {
        self.bound(within: (.min)...(range.upperBound - 1))
    }
    
}

public extension FixedWidthInteger {
    func asDouble() -> Double {
        .init(self)
    }
}
