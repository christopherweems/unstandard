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
