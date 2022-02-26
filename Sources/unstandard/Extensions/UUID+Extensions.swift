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


// MARK: - Bytes

extension UUID {
    public var bytes: [UInt8] {
        let components = self.uuid
        
        return [
            components.0, components.1, components.2, components.3,
            components.4, components.5, components.6, components.7,
            components.8, components.9, components.10, components.11,
            components.12, components.13, components.14, components.15,
        ]
    }
    
    public init?(bytes: [UInt8]) {
        guard bytes.count == 16 else { return nil }
        self.init(uuid: bytes.asTuple16())
    }
    
}


// MARK: -

extension UUID {
    public init?(uuidString: String?) {
        guard let uuidString = uuidString else { return nil }
        self.init(uuidString: uuidString)
    }
    
}


/// Usage: `UUID.String` can be used in declarations to specify what kind of String the function expects
extension UUID {
    public typealias String = Swift.String
    
}
