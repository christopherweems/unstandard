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
