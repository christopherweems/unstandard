//
//  UserDefaults+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/19/21.
//

import Foundation

extension UserDefaults {
    private subscript<Key, Value>(key: Key, defaultValue defaultValue: Value) -> Value where Key : RawRepresentable, Key.RawValue == String {
        (try? self.value(forKey: key, valueType: Value.self)) ?? defaultValue
    }
    
    private func value<Key, Value>(forKey key: Key, valueType: Value.Type = Value.self) throws -> Value? where Key : RawRepresentable, Key.RawValue == String {
//        let key = key.rawValue
//
//        if valueType == Bool.self {
//            return self.bool(forKey: key) as? Value
//
//        } else {
//            throw CocoaError(.)
//        }
        fatalError()
    }
    
}
