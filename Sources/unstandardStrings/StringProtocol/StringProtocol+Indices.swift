//
//  StringProtocol+Indices.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

import Foundation


extension StringProtocol {
    public func index(_ indexKeyPath: KeyPath<Self, Index>, offsetBy offset: Int) -> Index {
        self.index(self[keyPath: indexKeyPath], offsetBy: offset)
    }
    
}


// MARK: - Staging

extension String {
    // not ready for primetime
    internal func indices(matching characterSet: CharacterSet) -> [Self.Index] {
        var matches = [Index]()
        
        var index = startIndex
        
        while index != endIndex {
            if self[index].unicodeScalars.allSatisfy(characterSet.contains) {
                matches.append(index)
                
            }
            
            index = self.index(after: index)
            
        }
        
        return matches
    }
    
}
