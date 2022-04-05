//
//  StringProtocol+Classification.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

import Foundation

extension StringProtocol {
    internal func allSatisfy(is characterSet: CharacterSet) -> Bool {
        unicodeScalars.allSatisfy(characterSet.contains)
    }
    
}
