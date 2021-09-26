//
//  CharacterSet+SetAlgebra.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import Foundation

extension CharacterSet {
    internal func contains(_unicodeScalarsOf character: Character) -> Bool {
        character.unicodeScalars.allSatisfy(self.contains(_:))
    }
    
}
