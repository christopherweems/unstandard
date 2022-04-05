//
//  String+Insertion.swift
//  
//
//  Created by Christopher Weems on 1/10/22.
//

import Foundation

extension String {
    /// - Returns: Boolean specifying if string could be inserted
    @discardableResult
    public mutating func insert(_ other: Self, beforeLastOccurrenceOf substring: Self) -> Bool {
        guard let insertionIndex = self.range(of: substring, options: .backwards)?.lowerBound else { return false }
        self.insert(contentsOf: other, at: insertionIndex)
        return true
    }
    
}
