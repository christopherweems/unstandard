//
//  IteratorProtocol+Extensions.swift
//  
//
//  Created by Christopher Weems on 7/30/22.
//

extension IteratorProtocol {
    public mutating func mapNext<T>(_ transform: (Element) throws -> T) rethrows -> T? {
        guard let next = self.next() else { return nil }
        return try transform(next)
    }
    
}
