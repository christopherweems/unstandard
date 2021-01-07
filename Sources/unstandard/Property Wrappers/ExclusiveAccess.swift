//
//  ExclusiveAccess.swift
//  
//
//  Created by Christopher Weems on 1/7/21.
//

import Foundation

@propertyWrapper
public struct ExclusiveAccess<V> {
    private let accessSemaphore = DispatchSemaphore(value: 1)
    private var _wrappedValue: V
    
    public var wrappedValue: V {
        get {
            accessSemaphore.wait()
            defer { accessSemaphore.signal() }
            return _wrappedValue
        }
        set {
            accessSemaphore.wait()
            defer { accessSemaphore.signal() }
            _wrappedValue = newValue
        }
    }
    
    public init(wrappedValue: V) {
        self._wrappedValue = wrappedValue
        
    }
    
}
