//
//  Collection+Filter.swift
//  
//
//  Created by Christopher Weems on 11/11/21.
//

import Foundation

// MARK: - String Comparison Filtering

extension Collection where Element : StringProtocol {
    public func filter<SP>(_ comparisonResult: ComparisonResult,
                           _ other: SP, options: String.CompareOptions = [], locale: Locale? = nil) -> [Element]
    where SP : StringProtocol {
        self.filter { $0.compare(other, options: options, locale: locale) == comparisonResult }
    }
    
}

extension Collection {
    public func filter<T, O>(_ transform: (Element) -> T, _ comparisonResult: ComparisonResult,
                             _ other: O, options: String.CompareOptions = [], locale: Locale? = nil) -> [Element]
    where T: StringProtocol, O: StringProtocol {
        self.filter { transform($0).compare(other, options: options, locale: locale) == comparisonResult }
    }
    
}
