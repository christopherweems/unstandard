//
//  Collection+TypeConversion.swift
//  
//
//  Created by Christopher Weems on 3/28/22.
//

import Collections

extension Collection where Element : Hashable {
    public func asOrderedSet() -> OrderedSet<Element> {
        OrderedSet(self)
    }
    
}

