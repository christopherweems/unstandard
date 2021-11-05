//
//  UUID+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/1/21.
//

import Foundation
import Resultto

extension UUID {
    public init(@UUIDResult _ uuid: () -> UUID) {
        self = uuid()
    }
    
}

/// Usage: `UUID.String` can be used in declarations to specify what kind of String the function expects
extension UUID {
    public typealias String = Swift.String
    
}
