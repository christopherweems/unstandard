//
//  String.UnicodeScalarView+AffixAccessors.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

extension String.UnicodeScalarView {
    public func suffix(after index: Self.Index) -> SubSequence {
        guard index != endIndex else {
            return "".unicodeScalars.suffix(from: \.endIndex)
        }
        
        let startIndex = self.index(after: index)
        return self[startIndex...]
    }
    
}

extension String.UnicodeScalarView {
    public func suffix(after indexKeyPath: KeyPath<Self,Self.Index>) -> SubSequence {
        let startIndex = self[keyPath: indexKeyPath]
        return self.suffix(after: startIndex)
    }
    
    public func suffix(from indexKeyPath: KeyPath<Self,Self.Index>) -> SubSequence {
        let startIndex = self[keyPath: indexKeyPath]
        return self.suffix(from: startIndex)
    }
    
}


// MARK: - Has Prefix

extension String.UnicodeScalarView {
    public func hasPrefix<P>(_ prefix: P) -> Bool where P : StringProtocol {
        String(self).hasPrefix(prefix)
    }
    
}

extension Substring.UnicodeScalarView {
    public func hasPrefix<P>(_ prefix: P) -> Bool where P : StringProtocol {
        String(self).hasPrefix(prefix)
    }
    
}
