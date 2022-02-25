//
//  Int+Extensions.swift
//  
//
//  Created by Christopher Weems on 3/18/20.
//

import Foundation

extension StringProtocol {
    public func asInt() -> Int? {
        Int(self)
    }
    
}

extension Int {
    public init?(_ character: Character) {
        self.init(String(character))
    }
    
}
