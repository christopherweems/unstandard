//
//  File.swift
//  
//
//  Created by Christopher Weems on 10/7/20.
//

public protocol Updatable { }

extension Updatable {
    /// updating multiple values
    public func with(_ update: (inout Self) throws -> ()) rethrows -> Self {
        var new = self
        try update(&new)
        return new
    }
    
}

extension Updatable where Self : AnyObject {
    public func with(_ updates: (Self) throws -> Void) rethrows -> Self {
        try updates(self)
        return self
    }
        
}

public extension Updatable {
    func updating<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) -> Self {
        self.with {
            $0[keyPath: keyPath] = value
        }
    }
    
    mutating func update<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) {
        self = updating(keyPath, to: value)
    }
    
}

public extension Updatable {
    mutating func updating<Value>(_ keyPath: WritableKeyPath<Self, Value>, byInserting options: Value) -> Self where Value: OptionSet {
        self.with {
            $0[keyPath: keyPath] = self[keyPath: keyPath].union(options)
        }
    }
    
    mutating func update<Value>(_ keyPath: WritableKeyPath<Self, Value>, insert options: Value) where Value: OptionSet {
        self.update(keyPath, to: self[keyPath: keyPath].union(options))
    }
    
}


// MARK: - See Iffable & Wrappable when updating

extension Array : Updatable { }
extension ArraySlice : Updatable { }
extension Bool : Updatable { }
extension Character : Updatable { }
extension Dictionary : Updatable { }
extension Double : Updatable { }
extension Int : Updatable { }
extension Int64 : Updatable { }
extension Optional: Updatable where Wrapped: Updatable { }
extension Range: Updatable { }
extension Set : Updatable { }
extension String : Updatable { }
extension String.Index : Updatable { }
extension Substring : Updatable { }

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference : Updatable { }
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference.Change : Updatable { }


// MARK: - Deprecations

extension Updatable {
    @available(*, deprecated, renamed: "with(_:)")
    public func withUpdates(_ update: (inout Self) -> ()) -> Self {
        self.with(update)
    }
    
}
