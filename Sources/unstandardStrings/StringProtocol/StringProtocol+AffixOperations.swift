//
//  StringProtocol+AffixOperations.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

import Foundation

extension StringProtocol {
    public func suffix<SP>(overlappingPrefixOf other: SP) -> SubSequence
    where SP : StringProtocol, SP.SubSequence == Substring {
        guard !other.isEmpty else { return "" }
        
        var overlapLength = 1
        var overlapPrefixRange: Range<Index> { other.startIndex..<other.index(\.startIndex, offsetBy: overlapLength) }
        var overlap: SP.SubSequence? { other.prefix(overlapLength) }
        
        var lastMatch: Range<Index>?
        
        while true {
            guard overlapLength <= other.count else { break }
            defer { overlapLength += 1 }
            
            guard let overlapRange = range(of: other[overlapPrefixRange], options: [.backwards, .anchored]) else {
                continue
            }
            
            guard let overlap = overlap else { return "" }
            
            if self.hasSuffix(overlap) {
                lastMatch = overlapRange
                
            } else if lastMatch == nil {
                // overlap was found in last iteration
                break
                
            }
            
        }
        
        guard let overlapRange = lastMatch else { return "" }
        
        return self[overlapRange]
    }
    
}

extension StringProtocol {
    @_disfavoredOverload
    @inlinable public func suffix(from suffixStartIndex: Index) -> String {
        self.suffix(from: suffixStartIndex).asString()
    }
    
}

extension StringProtocol {
    public mutating func dropPrefix<P>(_ prefix: P) where Self == SubSequence, P : StringProtocol {
        precondition(self.hasPrefix(prefix))
        let newStartIndex = self.index(\.startIndex, offsetBy: prefix.count)
        self = self[newStartIndex...]
    }
    
    public func droppingPrefix<P>(_ prefix: P) -> SubSequence where P : StringProtocol {
        let newStartIndex = self.index(\.startIndex, offsetBy: prefix.count)
        return self[newStartIndex...]
    }
    
}

extension StringProtocol {
    public func trimmingPrefix<P>(_ prefix: P) -> SubSequence? where P : StringProtocol {
        guard self.hasPrefix(prefix) else { return nil }
        return self[self.index(\.startIndex, offsetBy: prefix.count)...]
    }
    
}
