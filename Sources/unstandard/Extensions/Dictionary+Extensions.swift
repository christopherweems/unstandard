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
    init(@SimpleArrayBuilder<Self> _ builder: () -> [Dictionary<Key, Value>]) {
        let keysAndValues = builder().flatMap { $0.map { ($0.key, $0.value) } }
        self.init(keysAndValues, uniquingKeysWith: { _, _ in fatalError() })
    }
}
