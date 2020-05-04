//
//  Array+Extensions.swift
//
//
//  Created by Christopher Weems on 5/22/17.
//

import Foundation

public extension Array {
    var indexOfLastItem: Int! {
        guard !isEmpty else { return nil }
        return count - 1
    }
    
    func contains(index: Int) -> Bool {
        return (0..<count).contains(index)
    }
}

public extension Array {
    var chooseOne: Element? {
        randomElement()
    }
    
    func choose(_ n: Int) -> [Element]? {
        guard n <= self.count else { return nil }
        return Array(shuffled().prefix(n))
    }
}

public extension Array {
    func at(_ index: Array.Index) -> Element? {
        guard (startIndex..<endIndex).contains(index) else { return nil }
        return self[index]
    }
}


// MARK: - Non Empty

public extension Array {
    var nonEmpty: Array? { isEmpty ? nil : self }
    
}


// MARK: - As Set

public extension Array where Element: Hashable {
    func asSet() -> Set<Element> {
        Set(self)
    }
}

