//
//  Iffable.swift
//  
//
//  Created by Christopher Weems on 1/22/20.
//

public protocol Iffable { }

public extension Iffable {
    func `if`(_ predicate: (Self) -> Bool) -> Self? {
        predicate(self) ? self : nil
    }
}

public extension Optional where Wrapped: Iffable {
    func `if`(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard case let .some(value) = self else { return nil }
        return predicate(value) ? value : nil
    }
}


/// MARK: - See Wrappable when updating

extension Array : Iffable { }
extension ArraySlice : Iffable { }
extension Bool : Iffable { }
extension Character : Iffable { }
extension Dictionary : Iffable { }
extension Double : Iffable { }
extension Int : Iffable { }
extension Int64 : Iffable { }
extension Optional: Iffable where Wrapped: Iffable { }
extension Range: Iffable { }
extension Set : Iffable { }
extension String : Iffable { }
extension String.Index : Iffable { }
extension Substring : Iffable { }

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference : Iffable { }
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CollectionDifference.Change : Iffable { }

