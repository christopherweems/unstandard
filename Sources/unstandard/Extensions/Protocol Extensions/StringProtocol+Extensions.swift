//
//  StringProtocol+Extensions.swift
//  
//
//  Created by Christopher Weems on 5/24/20.
//

import Foundation

public extension StringProtocol {
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


// MARK: - .trimmingFromEnd(_:)

public extension StringProtocol {
    func trimmingFromEnd(_ trim: CharacterSet) -> String {
        guard let endIndex = unicodeScalars.lastIndex(where: trim.contains) else { return self.asString() }
        return self[..<endIndex].asString()
    }
}

