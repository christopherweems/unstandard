//
//  String.LineRanges.swift
//  
//
//  Created by Christopher Weems on 1/17/22.
//

import Foundation

extension String {
    public struct LineRanges: Sequence, IteratorProtocol {
        public enum EnumerationDirection {
            case forward
            case backward
            
        }
        
        fileprivate var string: String
        fileprivate var remaining: Substring
        fileprivate let direction: EnumerationDirection
        fileprivate var includeEmptyLines: Bool
        
        public mutating func next() -> Range<String.Index>? {
            guard !remaining.isEmpty else {
                let shouldIncludeLastRemainingRange = (includeEmptyLines &&
                                                       direction == .forward &&
                                                       string.hasSuffix("\n"))
                includeEmptyLines = false
                return shouldIncludeLastRemainingRange ? remaining.fullRange : nil
            }
            
            switch direction {
            case .forward:
                let nextLineBreakIndex = remaining.firstIndex(where: \.isNewline)
                let remainingStartIndex: Substring.Index
                
                if let nextLineBreakIndex = nextLineBreakIndex {
                    remainingStartIndex = remaining.index(after: nextLineBreakIndex)
                    
                } else {
                    remainingStartIndex = remaining.endIndex
                    
                }
                
                let line = remaining[..<(nextLineBreakIndex ?? remaining.endIndex)]
                remaining = remaining[remainingStartIndex...]
                
                guard includeEmptyLines || !line.isEmpty else { return next() }
                return line.fullRange
                
            case .backward:
                let preceedingLineBreakIndex = remaining.lastIndex(where: \.isNewline)
                let remainingStartIndex: String.Index
                
                guard preceedingLineBreakIndex != remaining.endIndex else {
                    remaining = remaining[..<preceedingLineBreakIndex!]
                    return remaining.isEmpty ? nil : next()
                }
                
                if let preceedingLineBreakIndex = preceedingLineBreakIndex {
                    remainingStartIndex = remaining.index(after: preceedingLineBreakIndex)
                    
                } else {
                    remainingStartIndex = remaining.startIndex
                    
                }
                
                let line = remaining[remainingStartIndex...]
                remaining = remaining[..<(preceedingLineBreakIndex ?? remainingStartIndex)]
                
                guard includeEmptyLines || !line.isEmpty else { return next() }
                return line.fullRange
            }
        }
        
    }
    
    public func lineRanges(
        _ direction: LineRanges.EnumerationDirection = .forward,
        includeEmptyLines: Bool = true
    ) -> LineRanges {
        .init(
            string: self,
            remaining: Substring(self),
            direction: direction,
            includeEmptyLines: includeEmptyLines)
    }
    
}
