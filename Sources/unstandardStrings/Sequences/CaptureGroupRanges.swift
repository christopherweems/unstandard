//
//  CaptureGroupRanges.swift
//  
//
//  Created by Christopher Weems on 2/3/22.
//

public struct CaptureGroupRanges<Base>: Sequence, IteratorProtocol
where Base : StringProtocol {
    private let base: Base
    private let includeNonCaptureGroups: Bool
    private var remainingSearchRange: Range<Base.Index>
    
    public mutating func next() -> Range<Base.Index>? {
        guard !remainingSearchRange.isEmpty else { return nil }
        
        var captureGroupDepth = 0
        
        var captureGroupLowerBound: Base.Index?
        var captureGroupUpperBound: Base.Index?
        
        findCaptureGroups: for (characterIndex, character) in self.remainingSearchString.indexed() {
            var remainingSearchString: Base.SubSequence { self.remainingSearchString[characterIndex...] }
            var isNonCaptureGroup: Bool { remainingSearchString.hasPrefix("(?:") }
            
            switch character {
            case "(" where !includeNonCaptureGroups && isNonCaptureGroup:
                continue
                
            case "(":
                captureGroupDepth += 1
                
                if captureGroupLowerBound == nil {
                    // open capture group
                    captureGroupLowerBound = characterIndex
                    
                }
                
                
            case ")":
                captureGroupDepth -= 1
                
                if captureGroupDepth == 0 {
                    // closing opened capture group
                    captureGroupUpperBound = remainingSearchString.index(after: characterIndex)
                    
                    // include trailing "?" in capture group range
                    if captureGroupUpperBound != remainingSearchString.endIndex && remainingSearchString[captureGroupUpperBound!] == "?" {
                        captureGroupUpperBound = remainingSearchString.index(after: captureGroupUpperBound!)
                        
                    }
                    
                    break findCaptureGroups
                    
                } else if captureGroupDepth < 0 {
                    // stop indexing string with imbalanced capture groups
                    remainingSearchRange = base.endIndex..<base.endIndex
                    return nil
                }
                
            default:
                break
                
            }
        }
        
        guard let captureGroupLowerBound = captureGroupLowerBound,
              let captureGroupUpperBound = captureGroupUpperBound else {
                  remainingSearchRange = base.endIndex..<base.endIndex
                  return nil
              }
        
        remainingSearchRange = base.index(after: captureGroupLowerBound)..<base.endIndex
        return captureGroupLowerBound..<captureGroupUpperBound
    }
    
    public init(_ base: Base, includeNonCaptureGroups: Bool) {
        self.base = base
        self.includeNonCaptureGroups = includeNonCaptureGroups
        self.remainingSearchRange = base.startIndex..<base.endIndex
        
    }
    
}

extension CaptureGroupRanges {
    fileprivate var remainingSearchString: Base.SubSequence {
        base[remainingSearchRange]
    }
    
}
