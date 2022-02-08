//
//  SetAlgebra+Extensions.swift
//  
//
//  Created by Christopher Weems on 2/8/22.
//

extension SetAlgebra {
    public func contains<O>(
        any other: O
    ) -> Bool where O : Sequence, O.Element == Element {
        for otherElement in other {
            guard self.contains(otherElement) else { continue }
            return true
        }
        
        return false
    }
    
}
