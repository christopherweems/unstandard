//
//  UUIDResult.swift
//
//
//  Created by Christopher Weems on 9/29/20.
//  Copyright © 2020 Christopher Weems. All rights reserved.
//

import Foundation

@_functionBuilder
public struct UUIDResult {
    public static func buildBlock(_ uuid: UUID) -> UUID {
        uuid
    }
    
    public static func buildEither(first: UUID) -> UUID {
        first
    }
    
    public static func buildEither(second: UUID) -> UUID {
        second
    }
    
}

public extension UUIDResult {
    static func buildExpression(_ uuid: UUID) -> UUID {
        uuid
    }
    
    static func buildExpression(_ uuid: uuid_t) -> UUID {
        .init(uuid: uuid)
    }
    
}
