//
//  String+PatternMatching.swift
//  
//
//  Created by Christopher Weems on 2/8/22.
//

import Foundation
import unstandardFoundation

extension String {
    public func firstRange(containing regularExpression: String) -> RegularExpressionRange? {
        .init(firstOf: regularExpression, in: self)
    }
    
}

public struct RegularExpressionRange {
    fileprivate let ranges: [Range<String.Index>]
    
    public init?(firstOf needleExpression: String, in haystackExpression: String) {
        guard let expression = try? NSRegularExpression(pattern: needleExpression) else {
            return nil
        }
        
        guard let ranges = expression.ranges(in: haystackExpression) else { return nil }
        
        self.ranges = ranges
        
    }
    
}

extension RegularExpressionRange {
    public subscript(rangeIndex: Int) -> Range<String.Index>? {
        ranges.at(rangeIndex)
    }
    
    // untested
    public subscript<RE>(
        _rangeExpression rangeExpression: RE
    ) -> ArraySlice<Range<String.Index>>? where RE : RangeExpression, RE.Bound == Int {
        return ranges[rangeExpression]
    }
    
}
