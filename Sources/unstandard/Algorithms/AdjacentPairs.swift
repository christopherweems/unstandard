//
//  File.swift
//  
//
//  Created by Christopher Weems on 10/9/20.
//

import Foundation

public struct LazyAdjacentPairs<Base: Collection> {
    public typealias AdjacentPair = (lower: Base.Element, upper: Base.Element)
    
    public let base: Base
    
}

extension LazyAdjacentPairs: LazyCollectionProtocol {
    public typealias Index = Base.Index
    
    public var startIndex: Index {
        base.startIndex
    }
    
    public var endIndex: Index {
        base.index(base.endIndex, offsetBy: -1)
    }
    
    public func index(after i: Index) -> Index {
        base.index(after: i)
    }
    
    public subscript(position: Index) -> AdjacentPair {
        (lower: base[position], upper: base[base.index(after: position)])
    }
    
}

extension LazyAdjacentPairs: BidirectionalCollection where Base: BidirectionalCollection {
    public func index(before i: Index) -> Index {
        base.index(before: i)
    }
    
}

extension LazyCollectionProtocol {
    public var adjacentPairs: LazyAdjacentPairs<Self> {
        LazyAdjacentPairs(base: self)
    }
    
}

extension Collection {
    public typealias AdjacentPair = LazyAdjacentPairs<Self>.AdjacentPair
    
    public var adjacentPairs: [AdjacentPair] {
        self.lazy
            .adjacentPairs
            .map { $0 }
    }
    
}
