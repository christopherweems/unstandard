//
//  Substring+SetAlgebra.swift
//
//
//  Created by Christopher Weems on 9/28/21.
//

extension Substring {
    public func overlaps(_ other: Substring) -> Bool {
        precondition(self.base == other.base, "Substrings must me from same base string")
        return self.fullRange.overlaps(other.fullRange)
    }
    
}
