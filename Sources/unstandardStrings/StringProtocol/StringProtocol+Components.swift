//
//  StringProtocol+Components.swift
//
//
//  Created by Christopher Weems on 9/30/21.
//

import Foundation

extension StringProtocol {
    public func headTailSplit(separator: Character) -> (head: SubSequence, tail: SubSequence)? {
        let components = split(separator: separator, maxSplits: 1)
        guard components.count == 2 else { return nil }
        
        return (components[0], components[1])
    }
    
}
