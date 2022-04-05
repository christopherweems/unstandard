//
//  Collection+Substring.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

//import Foundation

extension Collection where Element == Substring {
    public func substring(across range: Range<Index>) -> Substring {
        let startElement = self[range.lowerBound]
        let endElement = self.lastElement(of: range)
        precondition(startElement.base == endElement.base)
        
        let base = startElement.base
        return base[startElement.startIndex..<endElement.endIndex]
    }
    
}
