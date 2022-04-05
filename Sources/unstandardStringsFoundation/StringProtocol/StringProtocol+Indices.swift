//
//  StringProtocol+Indices.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

import Foundation

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
