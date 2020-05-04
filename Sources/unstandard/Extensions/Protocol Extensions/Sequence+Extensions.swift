//
//  Sequence+Extensions.swift
//
//
//  Created by Christopher Weems on 8/25/19.
//

public extension Sequence {
    func mapFirst<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> ElementOfResult? {
        for element in self {
            guard let mapped = try transform(element) else { continue }
            return mapped
        }
        
        return nil
    }
    
    func mapLast<ElementOfResult>(_ transform: (Self.Element) throws -> ElementOfResult?) rethrows -> ElementOfResult? {
        for element in self.reversed() {
            guard let mapped = try transform(element) else { continue }
            return mapped
        }
        
        return nil
    }
}
