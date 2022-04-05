//
//  StringProtocol+AffixOperations.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

import Foundation

extension StringProtocol {
    public func suffix(contains characterSet: CharacterSet) -> Bool {
        guard let lastCharacter = self.last else { return false }
        return lastCharacter.unicodeScalars.allSatisfy(characterSet.contains)
    }
    
}

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


// MARK: - Appending dropping overlap

extension StringProtocol {
    public func appending<SP>(_ aString: SP, droppingOverlap: Bool) -> String
    where SP: StringProtocol, SP.SubSequence == Substring {
        guard droppingOverlap else { return String(self) + aString }
        let suffix = self.suffix(overlappingPrefixOf: aString)
        return String(self[..<suffix.startIndex]) + aString
    }
    
}

extension String {
    public mutating func append<SP>(_ aString: SP, droppingOverlap: Bool)
    where SP: StringProtocol, SP.SubSequence == Substring {
        guard droppingOverlap else { self += aString; return }
        self = self.appending(aString, droppingOverlap: true)
    }
    
}
