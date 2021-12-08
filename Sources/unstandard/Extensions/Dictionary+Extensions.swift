//
//  Dictionary+Extensions.swift
//
//
//  Created by Christopher Weems on 7/11/19.
//

import Foundation


// MARK: -

extension Dictionary {
    public func first(whereKey keyPredicate: (Key) -> Bool) -> (key: Key, value: Value)? {
        return first(where: { keyPredicate($0.key) })
    }
    
}


// MARK: - Sorting values by key or value

extension Dictionary {
    public func sortedValues<V>(on sortKeyPath: KeyPath<Element, V>, reversed: Bool = false) -> [Value] where V : Comparable {
        self.sorted(on: sortKeyPath, comparison: { reversed ? $1 < $0 : $0 < $1 })
            .map(\.value)
    }
    
}


// MARK: -

extension Dictionary {
    public subscript(key: Key, initialValue initialValue: @autoclosure () -> Value) -> Value {
        mutating get {
            if let existing = self[key] {
                return existing
                
            } else {
                let initialValue = initialValue()
                self[key] = initialValue
                return initialValue
            }
        }
        set {
            self[key] = newValue
        }
    }
    
}



// MARK: -

extension Dictionary {
    @available(*, deprecated) // confusing in practice
    public init(uniqueValuesWithKeys valuesWithKeys: [(Value, Key)]) {
        self.init(uniqueKeysWithValues: valuesWithKeys.map { ($0.1, $0.0) })
    }
    
}


// MARK: -

extension Dictionary {
    public init(@ProtocolTypedArrayBuilder<Self> _ builder: () -> [Dictionary<Key, Value>]) {
        let keysAndValues = builder().flatMap { $0.map { ($0.key, $0.value) } }
        self.init(keysAndValues, uniquingKeysWith: { _, _ in fatalError() })
    }
    
}
