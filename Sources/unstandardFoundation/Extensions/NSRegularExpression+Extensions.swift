//
//  NSRegularExpression+Extensions.swift
//  
//
//  Created by Christopher Weems on 2/8/22.
//

import Foundation

extension NSRegularExpression {
    public func ranges(in haystackExpression: String) -> [Range<String.Index>]? {
        var ranges: [Range<String.Index>] = []
        let fullRange = NSRange(0..<(haystackExpression as NSString).length)
        
        self.enumerateMatches(in: haystackExpression, range: fullRange) { result, flags, _ in
            guard let result = result else { return }
            let rangesInResult = result.ranges.compactMap { Range($0, in: haystackExpression) }
            ranges.append(contentsOf: rangesInResult)
        }
        
        return !ranges.isEmpty ? ranges : nil
    }
    
}
