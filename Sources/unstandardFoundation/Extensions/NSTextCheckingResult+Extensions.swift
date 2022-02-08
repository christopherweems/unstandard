//
//  NSTextCheckingResult+Extensions.swift
//  
//
//  Created by Christopher Weems on 2/8/22.
//

import Foundation

extension NSTextCheckingResult {
    public var ranges: [NSRange] {
        (0..<numberOfRanges)
            .map(self.range(at:))
    }
    
}
