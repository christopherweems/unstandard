//
//  Character+TypeConversion.swift
//
//
//  Created by Christopher Weems on 2/21/21
//

import Foundation

extension Character {
    @_disfavoredOverload
    public init?<SP: StringProtocol>(_ optionalString: SP?) {
        guard let string = optionalString else { return nil }
        self.init(string.asString())
    }
    
}


