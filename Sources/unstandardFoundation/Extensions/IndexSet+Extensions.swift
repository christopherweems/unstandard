//
//  IndexSet+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/6/21.
//

import Foundation

extension Sequence where Element == IndexSet.Element {
    public func asIndexSet() -> IndexSet {
        var result = IndexSet()
        self.forEach { result.insert($0) }
        return result
    }
    
}
