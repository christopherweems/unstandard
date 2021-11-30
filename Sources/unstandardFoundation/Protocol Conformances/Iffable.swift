import Foundation
import unstandardProtocols

extension Data: Iffable { }
extension DateComponents: Iffable { }
extension Decimal: Iffable { }
extension NSObject : Iffable { }
extension URL : Iffable { }

#if canImport(CoreFoundation) && !os(Linux)
extension CFMutableString: Iffable { }

#endif

#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: Iffable { }
extension CGPoint: Iffable { }

#endif

