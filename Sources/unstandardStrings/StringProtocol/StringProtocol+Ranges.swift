//
//  StringProtocol+Ranges.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

// MARK: - Full Range

extension StringProtocol {
    public var fullRange: Range<Self.Index> {
        startIndex..<endIndex
    }
    
}

// MARK: - Range starting from an index

extension StringProtocol {
    public func range(from index: Index) -> Range<Index> {
        (index..<endIndex)
    }
    
}

// MARK: - Ranges of capture groups

extension StringProtocol {
    public func _captureGroupRanges(includeNonCaptureGroups: Bool) -> CaptureGroupRanges<Self> {
        .init(self, includeNonCaptureGroups: includeNonCaptureGroups)
    }
    
}
