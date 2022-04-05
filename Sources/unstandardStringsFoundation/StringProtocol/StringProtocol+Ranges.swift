//
//  StringProtocol+Ranges.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import struct Foundation.CharacterSet
import unstandardStrings

// MARK: -

extension StringProtocol {
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

// MARK: -

extension StringProtocol {
    public func ranges(of substring: String) -> SubstringRanges<Self> {
        .init(self, substring: substring)
    }
    
}


// MARK: -

internal enum SubstringRangeError: Error {
    case substringsNotSegmentOfBase

}

extension StringProtocol {
    public func ranges<S>(ofComponents components: S) throws -> [Range<Self.Index>]
    where S : Sequence, S.Element : StringProtocol {
        var ranges = [Range<Self.Index>]()
        var searchRange = self.fullRange

        for component in components {
            guard let substringRange = self.range(of: component, range: searchRange, locale: nil) else {
                throw SubstringRangeError.substringsNotSegmentOfBase
            }

            ranges.append(substringRange)
            searchRange = substringRange.upperBound..<self.endIndex
        }

        return ranges
    }

}
