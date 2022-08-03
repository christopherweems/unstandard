//
//  MonotonicLatest.swift
//  
//
//  Created by Christopher Weems on 8/3/22.
//

import Foundation

@propertyWrapper
public struct MonotonicLatest<Value> {
    private var _wrappedValue: Value
    private var areInIncreasingOrder: (Value, Value) -> Bool
    
    public var wrappedValue: Value {
        get { _wrappedValue }
        set {
            guard areInIncreasingOrder(_wrappedValue, newValue) else { return }
            _wrappedValue = newValue
        }
    }
    
    fileprivate init(wrappedValue: Value, areInIncreasingOrder: @escaping (Value, Value) -> Bool) {
        self._wrappedValue = wrappedValue
        self.areInIncreasingOrder = areInIncreasingOrder
        
    }
    
}

extension MonotonicLatest where Value : Comparable {
    public init(wrappedValue: Value) {
        self.init(wrappedValue: wrappedValue, areInIncreasingOrder: <)
    }
    
}

extension MonotonicLatest<NSNumber> {
    public init(wrappedValue: NSNumber) {
        self.init(wrappedValue: wrappedValue) {
            $0.compare($1) == .orderedAscending
        }
    }
    
}
