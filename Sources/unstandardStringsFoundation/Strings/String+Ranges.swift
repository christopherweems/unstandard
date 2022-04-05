//
//  String+Ranges.swift
//
//
//  Created by Christopher Weems on 9/28/21.
//

import Algorithms
import struct Foundation.CharacterSet
import struct Foundation.NSRange
import class Foundation.NSString

extension String {
    public func ranges(matching characterSet: CharacterSet) -> [Range<Index>] {
        self.unicodeScalars
            .chunked { characterSet.contains($0) && characterSet.contains($1) }
            .filter { characterSet.contains($0.first) }
            .compactMap {
                guard let start = $0.startIndex.samePosition(in: self),
                      let end = $0.endIndex.samePosition(in: self) else { return nil }
                return start..<end
            }
    }
    
}

extension String {
    public subscript(range: NSRange) -> String {
        (self as NSString).substring(with: range)
    }
    
}
