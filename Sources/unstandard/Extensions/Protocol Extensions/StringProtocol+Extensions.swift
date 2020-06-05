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
    func filtered(by filterSet: CharacterSet) -> String {
        self.unicodeScalars
            .filter(filterSet.contains)
            .map { String($0) }
            .joined()
    }
}