//
//  File.swift
//  
//
//  Created by Christopher Weems on 10/7/20.
//

import Foundation

public protocol Updatable { }

extension Updatable {
    /// updating multiple values
    public func with(_ update: (inout Self) -> ()) -> Self {
        var new = self
        update(&new)
        return new
    }
    
}

extension Updatable where Self : AnyObject {
    public func with(_ updates: (Self) -> Void) -> Self {
        updates(self)
        return self
    }
        
}

extension Updatable where Self : NSCopying {
    // Returns nil if copy result is not same type as original type
    public func copyWith(_ updates: (Self) -> Void) -> Self! {
        guard let new = self.copy() as? Self else { return nil }
        updates(new)
        return new
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
extension Data: Updatable { }
extension DateComponents: Updatable { }
extension Dictionary : Updatable { }
extension Double : Updatable { }
extension Int : Updatable { }
extension Int64 : Updatable { }
extension NSObject : Updatable { }
extension Optional: Updatable where Wrapped: Updatable { }
extension Range: Updatable { }
extension Set : Updatable { }
extension String : Updatable { }
extension String.Index : Updatable { }
extension Substring : Updatable { }
extension URL : Updatable { }

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference : Updatable { }
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference.Change : Updatable { }

#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Updatable { }

#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: Updatable { }
extension CGPoint: Updatable { }

#endif

// MARK: - Deprecations

extension Updatable {
    @available(*, deprecated, renamed: "with(_:)")
    public func withUpdates(_ update: (inout Self) -> ()) -> Self {
        self.with(update)
    }
    
}
