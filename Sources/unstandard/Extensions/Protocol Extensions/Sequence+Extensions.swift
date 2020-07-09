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


// MARK: - Stable Sort

public extension Sequence {
    func stableSorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element] {
        try enumerated()
            .sorted { a, b -> Bool in
                try areInIncreasingOrder(a.element, b.element) ||
                    (a.offset < b.offset && !areInIncreasingOrder(b.element, a.element))
            }
            .map { $0.element }
    }
}
