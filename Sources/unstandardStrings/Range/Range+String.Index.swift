//
//  Range+String.Index.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

import Foundation

extension Range where Bound == String.Index {
    public init(elementAt index: String.Index, in base: String) {
        precondition(index != base.endIndex, "Element cannot lie past range bounds")
        self.init(uncheckedBounds: (index, base.index(after: index)))
    }
    
}

extension Range where Bound == String.Index {
    public func isOneElement(in base: String) -> Bool {
        base.index(after: self.lowerBound) == self.upperBound
    }
    
    @available(*, deprecated, renamed: "isOneElement(in:)")
    public func hasOneElement(in base: String) -> Bool {
        self.isOneElement(in: base)
    }
    
}
