//
//  Sequence+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/7/21.
//

import Algorithms

extension Sequence {
    public func max<V>(on sortValue: (Element) throws -> V)
    rethrows -> Element? where V : Comparable {
        try self.max(by: {
            let first = try sortValue($0)
            let second = try sortValue($1)
            return first < second
        })
    }
    
    public func min<V>(on sortValue: (Element) throws -> V)
    rethrows -> Element? where V : Comparable {
        try self.min(by: {
            let first = try sortValue($0)
            let second = try sortValue($1)
            return first < second
        })
    }
    
}
