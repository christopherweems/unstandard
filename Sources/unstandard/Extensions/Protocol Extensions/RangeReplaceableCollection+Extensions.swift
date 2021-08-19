//
//  RangeReplaceableCollection+Extensions.swift
//
//
//  Created by Christopher Weems on 8/19/21.
//

public extension RangeReplaceableCollection {
    func appending(@ArrayBuilder _ builder: () -> [Element]) -> Self {
        var new = self
        new += builder()
        return new
    }
    
}
