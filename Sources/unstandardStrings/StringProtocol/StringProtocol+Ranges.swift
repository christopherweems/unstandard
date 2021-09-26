//
//  StringProtocol+Ranges.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import struct Foundation.CharacterSet
import Foundation


// MARK: - Full Range

extension StringProtocol {
    public var fullRange: Range<Self.Index> {
        startIndex..<endIndex
    }
    
}


// MARK: - Splitting Range

extension StringProtocol where SubSequence == Substring {
    public func ranges(separatedBy seperatingSet: CharacterSet) -> [Range<Index>] {
        var ranges = [Range<Index>]()
        
        var remainingSearchString = Substring(self)
        
        while true {
            let endIndex = remainingSearchString
                .firstIndex(where: seperatingSet.contains(_unicodeScalarsOf:)) ?? remainingSearchString.endIndex
            
            ranges.append(remainingSearchString.startIndex..<endIndex)
            
            guard endIndex != self.endIndex else {
                remainingSearchString = ""
                break
            }
            
            remainingSearchString = remainingSearchString[after: endIndex]
            
        }
        
        return ranges
    }
    
}
