//
//  SubstringRanges.swift
//  
//
//  Created by Christopher Weems on 2/3/22.
//

public struct SubstringRanges<Base : StringProtocol>: Sequence, IteratorProtocol {
    private let base: Base
    private let searchSubstring: String
    private var searchRange: Range<String.Index>
    
    public mutating func next() -> Range<String.Index>? {
        guard let foundSubstring = base.range(of: searchSubstring, range: searchRange) else {
            searchRange = base.endIndex..<base.endIndex
            return nil
        }
        
        searchRange = foundSubstring.upperBound..<searchRange.upperBound
        return foundSubstring
    }
    
    public init(_ base: Base, substring: String) {
        self.base = base
        self.searchSubstring = substring
        self.searchRange = base.startIndex..<base.endIndex
        
    }
    
}
