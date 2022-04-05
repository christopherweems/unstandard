//
//  CharacterSet+SetAlgebra.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import Foundation

extension CharacterSet {
    public func contains(_ member: Unicode.Scalar?) -> Bool {
        guard let member = member else { return false }
        return self.contains(member)
    }
    
    internal func contains(_unicodeScalarsOf character: Character) -> Bool {
        character.unicodeScalars.allSatisfy(self.contains(_:))
    }
    
}
