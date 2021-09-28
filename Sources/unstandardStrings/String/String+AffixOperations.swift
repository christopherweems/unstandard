//
//  String+Extensions.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

import Foundation

extension String {
    public func suffix<SP>(overlappingPrefixOf other: SP) -> SubSequence
    where SP : StringProtocol, SP.SubSequence == Substring {
        guard !other.isEmpty else { return "" }
        
        var overlapLength = other.count
        var overlapPrefixRange: Range<Index> { other.startIndex..<other.index(\.startIndex, offsetBy: overlapLength) }
        var overlap: SP.SubSequence? { other.prefix(overlapLength) }
        
        while true {
            defer { overlapLength -= 1 }
            guard let overlapRange = range(of: other[overlapPrefixRange], options: .backwards) else { continue }
            
            guard let overlap = overlap else { return "" }
            
            if self.hasSuffix(overlap) {
                return self[overlapRange]
                
            }
            
        }
    }
    
}

