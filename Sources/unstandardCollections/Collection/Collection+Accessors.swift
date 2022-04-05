//
//  Collection+Accessors.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

extension Collection {
    public func lastElement(of subrange: Range<Index>) -> Element {
        let elementIndex = self.index(subrange.upperBound, offsetBy: -1)
        return self[elementIndex]
    }
    
}
