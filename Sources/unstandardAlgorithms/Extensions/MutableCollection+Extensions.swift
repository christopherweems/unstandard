//
//  MutableCollection+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/12/21.
//

extension MutableCollection {
    @_disfavoredOverload
    public mutating func forEach(mutable body: (inout Element) -> Void) {
        self.indexed().forEach {
            var element = $0.element
            body(&element)
            self[$0.index] = element
        }
    }

}
