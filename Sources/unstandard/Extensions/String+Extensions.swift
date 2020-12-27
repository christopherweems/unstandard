//
//  String+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/9/20.
//

import Algorithms
import Foundation

public extension String {
    enum SpaceType: String {
        case hair = " "
        case figure = " "
        case sixPerEm = " "
        case zeroWidth = "​"
        
    }
    
    static func space(_ spaceType: SpaceType) -> String {
        spaceType.rawValue
    }
}


// MARK: - Split by string separators

public extension String {
    func split(separator: String,
               maxSplits: Int = Int.max,
               omittingEmptySubsequences: Bool = true) -> [String] {
        precondition(maxSplits == Int.max, "missing implementation for maxSplits != Int.max")
        
        // separators
        let separatorRanges = Array {
            Range(uncheckedBounds: (startIndex, startIndex))
            ranges(of: separator)
            Range(uncheckedBounds: (endIndex, endIndex))
            
        }
        
        // our strings lie between the separator ranges
        let splits = separatorRanges.adjacentPairs.map {
            self[$0.upperBound..<$1.lowerBound].asString()
        }
        
        // filter empty if required by `omittingEmptySubsequences`
        if omittingEmptySubsequences {
            return splits.filter { !$0.isEmpty }
            
        } else {
            return splits
            
        }
    }
}


// MARK: -

public extension String {
    mutating func replaceOccurrences<Target, Replacement>(of target: Target, with replacement: Replacement) where Target: StringProtocol, Replacement: StringProtocol {
        self = self.replacingOccurrences(of: target, with: replacement)
    }
    
}


// MARK: - Range of indexes to end

internal extension String {
    func rangeToEnd(startIndex: Index) -> Range<Index> {
        .init(uncheckedBounds: (lower: startIndex, upper: endIndex))
    }
}


//

public extension String {
    static func compareList(_ comparisonResult: ComparisonResult, options: CompareOptions,
                        @ArrayBuilder strings: () -> [String]) -> Bool {
        let strings = strings()
        precondition(!strings.isEmpty)
        
        for (lower, upper) in strings.lazy.adjacentPairs {
            if lower.compare(upper, options: options) != comparisonResult {
                return false
            }
        }
        
        return true
    }
    
    static func comparePair(_ comparisonResult: ComparisonResult, options: CompareOptions,
                        @PairBuilder pair: () -> (String, String)) -> Bool {
        let strings = pair()
        return compareList(comparisonResult, options: options, strings: { [strings.0, strings.1] })
    }
    
    @available(*, deprecated)
    static func compare(_ comparisonResult: ComparisonResult, options: CompareOptions,
                        @ArrayBuilder strings: () -> [String]) -> Bool {
        self.compareList(comparisonResult, options: options, strings: strings)
    }
}


// MARK: -

public extension String {
    func removeCamelCase(separator: String, capitalizeFirstComponent: Bool = true) -> String {
        let components = self.chunked { ($0.isUppercase || $1.isLowercase) || ($0.isNumber && $1.isNumber) }
        guard !components.isEmpty else { return "" }
        
        let first = capitalizeFirstComponent ? components[0].capitalized : components[0].asString()
        
        if components.containsSingleElement {
            return first
        
        } else {
            return first + separator + components.dropFirst().joined(separator: separator)
        }
    }
    
}


// MARK: -

internal extension String {
    func ranges<SP>(of substring: SP) -> [Range<Index>] where SP : StringProtocol {
        var ranges = [Range<String.Index>]()
        
        var lastEndIndex = startIndex
        
        while let nextRange = range(of: substring, range: rangeToEnd(startIndex: lastEndIndex)) {
            ranges.append(nextRange)
            lastEndIndex = nextRange.upperBound
            
        }
        
        return ranges
    }
}
