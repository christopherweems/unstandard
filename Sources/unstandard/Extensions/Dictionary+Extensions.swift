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
