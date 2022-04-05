//
//  StringProtocol+AffixOperations.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

extension StringProtocol {
    @_disfavoredOverload
    @inlinable public func suffix(from suffixStartIndex: Index) -> String {
        self.suffix(from: suffixStartIndex).asString()
    }
    
}

extension StringProtocol {
    // TODO: - Fix discrepancy between API of `dropSuffix` & `dropPrefix`
    public mutating func dropPrefix<P>(_ prefix: P) where Self == SubSequence, P : StringProtocol {
        precondition(self.hasPrefix(prefix))
        let newStartIndex = self.index(\.startIndex, offsetBy: prefix.count)
        self = self[newStartIndex...]
    }
    
    public func droppingPrefix<P>(_ prefix: P) -> SubSequence where P : StringProtocol {
        let newStartIndex = self.index(\.startIndex, offsetBy: prefix.count)
        return self[newStartIndex...]
    }
    
}

extension StringProtocol {
    public func trimmingPrefix<P>(_ prefix: P) -> SubSequence? where P : StringProtocol {
        guard self.hasPrefix(prefix) else { return nil }
        return self[self.index(\.startIndex, offsetBy: prefix.count)...]
    }
    
}

extension StringProtocol {
    // TODO: - Fix discrepancy between API of `dropSuffix` & `dropPrefix`
    @discardableResult
    public mutating func dropSuffix(_ suffix: String) -> Bool {
        guard self.hasSuffix(suffix) else { return false }
        _ = self.dropLast(suffix.count)
        return true
    }
    
}
