//
//  Wrappable.swift
//  
//
//  Created by Christopher Weems on 12/30/19.
//

public protocol Wrappable { }

extension Wrappable {
    public func wrap<Result>(_ wrapper: (Self) throws -> Result) rethrows -> Result {
        try wrapper(self)
    }
    
}

/// MARK: - See Iffable when updating

extension Bool : Wrappable { }
extension Character : Wrappable { }
extension Dictionary : Wrappable { }
extension Double : Wrappable { }
extension Int : Wrappable { }
extension Int64 : Wrappable { }
extension Optional: Wrappable where Wrapped : Wrappable { }
extension Range: Wrappable { }
extension Set : Wrappable { }
extension String.Index : Wrappable { }
extension Substring : Wrappable { }

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference : Wrappable { }
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference.Change : Wrappable { }

extension Sequence {
    public func wrap<Result>(_ wrapper: (Self) throws -> Result) rethrows -> Result {
        try wrapper(self)
    }
    
}

@available(*, unavailable, message: "Use direct `wrap` method on `Sequence`")
extension Array : Wrappable { }

@available(*, unavailable, message: "Use direct `wrap` method on `Sequence`")
extension ArraySlice : Wrappable { }

@available(*, unavailable, message: "Use direct `wrap` method on `Sequence`")
extension String : Wrappable { }
