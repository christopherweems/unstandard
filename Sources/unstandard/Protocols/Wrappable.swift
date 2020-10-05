//
//  Wrappable.swift
//  
//
//  Created by Christopher Weems on 12/30/19.
//

import Foundation

public protocol Wrappable { }

public extension Wrappable {
    func wrap<Result>(_ wrapper: (Self) throws -> Result) rethrows -> Result {
        try wrapper(self)
    }
    
}

/// MARK: - See Iffable when updating

extension Array : Wrappable { }
extension ArraySlice : Wrappable { }
extension Bool : Wrappable { }
extension Character : Wrappable { }
extension CollectionDifference : Wrappable { }
extension CollectionDifference.Change : Wrappable { }
extension DateComponents: Wrappable { }
extension Dictionary : Wrappable { }
extension Double : Wrappable { }
extension Int : Wrappable { }
extension Int64 : Wrappable { }
extension NSObject : Wrappable { }
extension Optional: Wrappable where Wrapped : Wrappable { }
extension Range: Wrappable { }
extension Set : Wrappable { }
extension String : Wrappable { }
extension String.Index : Wrappable { }
extension Substring : Wrappable { }
extension URL : Wrappable { }


#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Wrappable { }

#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: Wrappable { }
extension CGPoint: Wrappable { }

#endif


// MARK: - 

public extension Optional where Wrapped : Wrappable {
    func wrap<Result>(_ wrapper: (Wrapped) throws -> Result) rethrows -> Optional<Result> {
        switch self {
        case .some(let wrapped):
            return try wrapper(wrapped)
            
        case .none:
            return nil
            
        }
    }
    
}
