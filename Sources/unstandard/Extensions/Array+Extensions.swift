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


// MARK: - Splitting into groups

public enum CollectionSplittingStrategy: Equatable {
    case fillBackward
    // ^^ Array of 42 elements split by 20: [20], [20], [2]
    
    indirect case evenly(fallback: CollectionSplittingStrategy)
    // ^^ Array of 63 elements split by 20 with fill backward fallback: [16, 16, 16, 15]
    //    evenly case as a fallback is a programming error
    
}


public extension Array {
    func split(intoGroupsOf maxCountPerBucket: Int, splittingStrategy: CollectionSplittingStrategy = .fillBackward) -> Array<[Element]> {
        assert(splittingStrategy == .fillBackward, "Only .fillBackward strategy implemented")
        
        var containers = Array<[Element]>()
        
        var elementCountInThisBucket = 0
        
        self.forEach {
            if maxCountPerBucket == elementCountInThisBucket {
                elementCountInThisBucket = 0
            }
            
            if elementCountInThisBucket == 0 {
                containers.append([Element]())
            }
            
            var last = containers.popLast()!
            last.append($0)
            
            elementCountInThisBucket += 1
            containers.append(last)
            
        }
        
        return containers
    }
}

// MARK: - Appending elements

public extension Array {
    func appending(@SimpleArrayBuilder<Element> _ element: () -> Element) -> Self {
        var new = self
        new.append(element())
        return new
    }
    
    func appending(@SimpleArrayBuilder<Element> _ elements: () -> [Element]) -> Self {
        var new = self
        new += elements()
        return new
    }
}

