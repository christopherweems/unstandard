//
//  Collection+Variations.swift
//  
//
//  Created by Christopher Weems on 5/21/22.
//

import Algorithms

extension Collection {
    public func variations<P, U>(
        of property: (Element) -> [P],
        uniquedOn uniqueProjection: (P) -> U
    ) -> [P] where U : Hashable {
        self.flatMap { property($0) }
            .uniqued(on: uniqueProjection)
    }
    
}

extension Collection {
    public func variations<P: Hashable, U: Hashable, S: Comparable>(
        of property: (Element) -> [P],
        uniquedOn uniqueProjection: (P) -> U,
        sortedOn sortProjection: (P) -> S
    ) -> [P] {
        self.variations(of: property, uniquedOn: uniqueProjection)
            .sorted { sortProjection($0) < sortProjection($1) }
    }
    
    public func variations<P: Hashable, S: Comparable>(
        of property: (Element) -> [P],
        sortedOn sortProjection: (P) -> S
    ) -> [P] {
        self.variations(of: property, uniquedOn: { $0.hashValue }, sortedOn: sortProjection)
    }
    
    public func variations<P>(
        of property: (Element) -> [P]
    ) -> [P] where P : Hashable, P : RawRepresentable, P.RawValue : Comparable {
        self.variations(of: property, sortedOn: \.rawValue)
    }
    
}
