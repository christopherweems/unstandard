//
//  StringProtocol+TypeConversion.swift
//  
//
//  Created by Christopher Weems on 10/30/21.
//

extension StringProtocol {
    @inlinable
    public func asString() -> String {
        if let string = self as? String {
            return string
        }
        
        return .init(self)
    }
    
}

extension StringProtocol {
    public func asCharacter() -> Character? {
        Character(self)
    }
    
}

extension Optional where Wrapped : StringProtocol {
    public func asCharacter() -> Character? {
        self?.asCharacter()
    }
    
}
