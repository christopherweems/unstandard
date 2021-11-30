import Foundation
import unstandardProtocols

extension Data: Wrappable { }
extension DateComponents: Wrappable { }
extension Decimal : Wrappable { }
extension NSObject : Wrappable { }
extension URL : Wrappable { }

#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Wrappable { }

#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: Wrappable { }
extension CGPoint: Wrappable { }

#endif
