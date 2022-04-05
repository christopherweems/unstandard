//
//  BidirectionalCollection+Extensions.swift
//  
//
//  Created by Christopher Weems on 1/30/22.
//

@available(macOS 10.15, *)
@available(iOS 13, *)
@available(tvOS 13, *)
@available(watchOS 6, *)
extension BidirectionalCollection where Element : Hashable {
    public func uniqueInsertions(updatingFrom previousState: @autoclosure () -> Self) -> [Element] {
        let previousState = previousState()
        let previousValues = Set(previousState)
        let newInsertions = self.difference(from: previousState).insertions.map(\.element)
        return newInsertions.lazy.filter { !previousValues.contains($0) }
    }
    
}

