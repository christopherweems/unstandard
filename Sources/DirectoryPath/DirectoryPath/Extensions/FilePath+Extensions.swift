//  FilePath+Extensions.swift
//  9/10/21

import SystemPackage

extension FilePath : FilePathProtocol {
    public var filePath: FilePath {
        self
    }
    
    __consuming public func appending<Result>(_ other: __owned String, resultType: Result.Type = Result.self)
        -> Result where Result : FilePathProtocol {
            if Result.self == FilePath.self {
                return self.appending(other) as! Result
                
            } else {
                let intermediate = self.appending(other)
                return Result(intermediate)
            }
    }
    
    __consuming public func appending<Result>(_ other: __owned FilePath.Component, resultType: Result.Type = Result.self)
        -> Result where Result : FilePathProtocol {
            if Result.self == FilePath.self {
                return self.appending(other) as! Result
                
            } else {
                let intermediate = self.appending(other)
                return Result(intermediate)
            }
    }
    
    public mutating func removePrefix<Prefix>(_ prefix: Prefix) -> Bool where Prefix : FilePathProtocol {
        self.removePrefix(prefix.filePath)
    }
    
    public init(_ filePath: FilePath) {
        self = filePath
        
    }
    
}
