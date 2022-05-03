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
    public mutating func dropPrefix<P>(_ prefix: P) where Self == SubSequence, P : StringProtocol {
        precondition(self.hasPrefix(prefix), "\(self) does not have prefix \(prefix)")
        let newStartIndex = self.index(\.startIndex, offsetBy: prefix.count)
        self = self[newStartIndex...]
    }
    
    public func droppingPrefix<P>(_ prefix: P) -> SubSequence where P : StringProtocol {
        precondition(self.hasPrefix(prefix), "\(self) does not have prefix \(prefix)")
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
    public mutating func dropSuffix<S>(_ suffix: S) where Self == SubSequence, S : StringProtocol {
        precondition(self.hasSuffix(suffix), "\(self) does not have suffix \(suffix)")
        let newEndIndex = self.index(\.endIndex, offsetBy: -suffix.count)
        self = self[..<newEndIndex]
    }
    
    public func droppingSuffix<S>(_ suffix: S) -> SubSequence where S : StringProtocol {
        precondition(self.hasSuffix(suffix), "\(self) does not have suffix \(suffix)")
        let newEndIndex = self.index(\.endIndex, offsetBy: -suffix.count)
        return self[..<newEndIndex]
    }
    
}
