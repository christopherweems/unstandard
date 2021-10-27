//
//  StringProtocol+Components.swift
//
//
//  Created by Christopher Weems on 9/30/21.
//

import Foundation

extension StringProtocol {
    public func headTailSplit(separator: Character, from position: Position = .start) -> (head: SubSequence, tail: SubSequence)? {
        guard let splitIndex = index(of: separator, from: position) else { return nil }
        let tailStartIndex = index(after: splitIndex)
        
        guard splitIndex != startIndex && tailStartIndex != endIndex else { return nil }
        
        return (self[..<splitIndex], self[tailStartIndex...])
    }
    
}
