//
//  StringProtocol+Components.swift
//
//
//  Created by Christopher Weems on 9/30/21.
//

import Algorithms

extension StringProtocol {
    public func headTailSplit(separator: Character, from position: Position = .start) -> (head: SubSequence, tail: SubSequence)? {
        guard let splitIndex = index(of: separator, from: position) else { return nil }
        let tailStartIndex = index(after: splitIndex)
        
        guard splitIndex != startIndex && tailStartIndex != endIndex else { return nil }
        
        return (self[..<splitIndex], self[tailStartIndex...])
    }
    
}

extension StringProtocol {
    public func split(before isHeadElement: (Element) -> Bool) -> [SubSequence] {
        let splitIndexes: [Index] = self.indexed()
            .filter { isHeadElement($0.element) }
            .map(\.index)
        
        return ([startIndex] + splitIndexes + [endIndex])
            .adjacentPairs()
            .map { self[$0..<$1] }
    }
    
}

extension StringProtocol {
    public func adjacentChunks(by belongInSameGroup: (Character, Character) -> Bool) -> [SubSequence] {
        self.chunked(by: belongInSameGroup)
            .windows(ofCount: 3)
            .striding(by: 2)
            .map { self[($0.first!.startIndex)..<($0.last!.endIndex)] }
    }
    
}
