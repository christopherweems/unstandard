//
//  StringProtocol+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/24/20.
//

import Foundation


// MARK: -

public extension StringProtocol {
    func `as`<Other: ExpressibleByStringLiteral>(_ type: Other.Type) -> Other where Other.StringLiteralType == Self {
        Other(stringLiteral: self)
    }
    
}

public extension StringProtocol {
    @inlinable
    func asString() -> String {
        if let string = self as? String {
            return string
        
        }
        
        return .init(self)
    }
    
}

public extension StringProtocol {
    func asDouble() -> Double? {
        Double(self)
    }
    
}


// MARK: - .filtered(by:)

public extension StringProtocol {
    func filtered(by filterSet: CharacterSet) -> String {
        self.unicodeScalars
            .filter(filterSet.contains)
            .map { String($0) }
            .joined()
    }
    
}


// MARK: - .leftPadding(...)

public extension StringProtocol {
    func leftPadding(toLength: Int, withPad character: Character, shouldTruncate: Bool = false) -> String {
        let newLength = self.count
        
        switch newLength {
        case ..<toLength:
            return String(repeatElement(character, count: toLength - newLength)) + self
            
        case _ where shouldTruncate:
            return self[index(self.startIndex, offsetBy: newLength - toLength)...].asString()
            
        default:
            return self.asString()
            
        }
    }
    
}


// MARK: - Non Empty

public extension StringProtocol {
    var nonEmpty: Self? {
        guard !isEmpty else { return nil }
        return self
    }
    
}


// MARK: - Dropping Suffix

public extension StringProtocol {
    func droppingSuffix(_ suffixes: String...) -> String? {
        guard let suffixToRemove = suffixes.first(where: self.hasSuffix) else { return nil }
        let endIndex = index(self.endIndex, offsetBy: -suffixToRemove.count)
        return self.prefix(upTo: endIndex).asString()
    }
    
}


// MARK: - .trimmingFromEnd(charactersIn:)

public extension StringProtocol {
    func trimmingFromEnd(charactersIn trim: CharacterSet) -> String {
        guard let endIndex = unicodeScalars.lastIndex(where: trim.contains) else { return self.asString() }
        return self[..<endIndex].asString()
    }
    
}


// MARK: - .uppercased(_:)

public extension StringProtocol {
    func uppercased(_ uppercased: Bool) -> String {
        uppercased ? self.uppercased() : self.asString()
    }
    
}
