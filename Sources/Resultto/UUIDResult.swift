//  UUIDResult.swift
//  12/4/20

#if canImport(Foundation)
import Foundation

@resultBuilder
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

#endif
