//
//  SetAlgebra+Extensions.swift
//  
//
//  Created by Christopher Weems on 2/8/22.
//

extension SetAlgebra {
    public func contains(any other: some Sequence<Element>) -> Bool {
        other.contains(where: self.contains)
    }
    
}

extension SetAlgebra {
    public func contains(optional member: Element?) -> Bool {
        guard let member else { return false }
        return self.contains(member)
    }
    
}
