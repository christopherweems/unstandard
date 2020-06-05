//
//  Int+Extensions.swift
//  
//
//  Created by Christopher Weems on 3/18/20.
//

import Foundation

public extension String {
    func asInt() -> Int? {
        Int(self)
    }
}

public extension Int {
    init?(_ character: Character) {
        self.init(String(character))
    }
}
