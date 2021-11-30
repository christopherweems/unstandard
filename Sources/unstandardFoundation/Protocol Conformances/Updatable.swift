import Foundation
import unstandardProtocols

extension Updatable where Self : NSCopying {
    // Returns nil if copy result is not same type as original type
    public func copyWith(_ updates: (Self) -> Void) -> Self! {
        guard let new = self.copy() as? Self else { return nil }
        updates(new)
        return new
    }
    
}

extension Data: Updatable { }
extension DateComponents: Updatable { }
extension NSObject : Updatable { }
extension URL : Updatable { }

#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Updatable { }

#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: Updatable { }
extension CGPoint: Updatable { }

#endif
