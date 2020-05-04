//
//  Wrappable.swift
//  
//
//  Created by Christopher Weems on 12/30/19.
//

import Foundation

public protocol Wrappable { }

public extension Wrappable {
    func wrap<Result>(_ wrapper: (Self) -> Result) -> Result {
        wrapper(self)
    }
}

/// MARK: - See Iffable when updating

extension Array : Wrappable { }
extension Bool : Wrappable { }
extension Character : Wrappable { }
extension Dictionary : Wrappable { }
extension NSObject : Wrappable { }
extension Optional: Wrappable where Wrapped: Wrappable { }
extension Set : Wrappable { }
extension String : Wrappable { }
extension String.Index : Wrappable { }
extension Substring : Wrappable { }


#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Wrappable { }

#endif
