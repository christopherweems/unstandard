//
//  File.swift
//  
//
//  Created by Christopher Weems on 10/7/20.
//

import Foundation

public protocol Updatable { }

public extension Updatable {
    /// updating multiple values
    func withUpdates(_ update: (inout Self) -> ()) -> Self {
        var new = self
        update(&new)
        return new
    }
    
}

public extension Updatable {
    func updating<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) -> Self {
        withUpdates {
            $0[keyPath: keyPath] = value
        }
    }
    
    mutating func update<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) {
        self = updating(keyPath, to: value)
    }
    
}

public extension Updatable {
    mutating func updating<Value>(_ keyPath: WritableKeyPath<Self, Value>, byInserting options: Value) -> Self where Value: OptionSet {
        withUpdates {
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
extension CollectionDifference: Updatable { }
extension CollectionDifference.Change: Updatable { }
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


#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Updatable { }

#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: Updatable { }
extension CGPoint: Updatable { }

#endif

