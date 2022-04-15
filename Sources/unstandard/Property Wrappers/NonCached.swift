//
//  NonCached.swift
//  
//
//  Created by Christopher Weems on 4/14/22.
//

@propertyWrapper
public struct NonCached<Value> : Sendable where Value : Sendable {
    internal var _wrappedValue: @Sendable () -> Value
    
    public var wrappedValue: Value {
        _wrappedValue()
    }
    
    public init(wrappedValue deferredValue: @Sendable @escaping @autoclosure () -> Value) {
        _wrappedValue = deferredValue
        
    }
    
    public init(deferredValue: @Sendable @escaping () -> Value) {
        _wrappedValue = deferredValue
        
    }
    
}
