//
//  Memoized.swift
//
//
//  Created by Christopher Weems on 11/1/20.
//

@propertyWrapper
public class Memoized<V> {
    private var builder: (() -> V)?
    private var computed: V!
    
    public var wrappedValue: V {
        guard computed == nil else { return computed }
        computed = builder!()
        builder = nil
        return computed
    }
    
    public init(wrappedValue: @autoclosure @escaping () -> V) {
        self.builder = wrappedValue
    }
    
    public init(builder: @escaping () -> V) {
        self.builder = builder
    }
    
}

public extension Memoized {
    func child<P>(_ keyPath: KeyPath<V, P>) -> Memoized<P> {
        Memoized<P>(builder: { self.wrappedValue[keyPath: keyPath] })
    }
    
}

public extension Memoized {
    func asOptional() -> Memoized<V?> {
        Memoized<V?>(builder: { Optional(self.wrappedValue) })
    }
    
}
