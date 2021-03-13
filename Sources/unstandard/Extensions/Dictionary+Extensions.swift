//
//  Dictionary+Extensions.swift
//
//
//  Created by Christopher Weems on 7/11/19.
//

import Foundation

public extension Dictionary {
    func first(whereKey keyPredicate: (Key) -> Bool) -> (key: Key, value: Value)? {
        return first(where: { keyPredicate($0.key) })
    }
}


// MARK: -

public extension Dictionary {
    subscript(key: Key, initialValue initialValue: @autoclosure () -> Value) -> Value {
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

public extension Dictionary {
    init(uniqueValuesWithKeys valuesWithKeys: [(Value, Key)]) {
        self.init(uniqueKeysWithValues: valuesWithKeys.map { ($0.1, $0.0) })
        
    }
    
}


// MARK: -

public extension Dictionary {
    init(@ProtocolTypedArrayBuilder<Self> _ builder: () -> [Dictionary<Key, Value>]) {
        let keysAndValues = builder().flatMap { $0.map { ($0.key, $0.value) } }
        self.init(keysAndValues, uniquingKeysWith: { _, _ in fatalError() })
    }
    
}
