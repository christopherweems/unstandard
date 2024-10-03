//  FilePathProtocol.swift
//  8/30/21

import SystemPackage

public protocol FilePathProtocol: Hashable, Codable, ExpressibleByStringLiteral, CustomStringConvertible, CustomDebugStringConvertible {
    typealias Component = FilePath.Component
    
    __consuming func appending<Result>(_ other: __owned String, resultType: Result.Type)
        -> Result where Result : FilePathProtocol
    
    __consuming func appending<Result>(_ other: __owned Component, resultType: Result.Type)
        -> Result where Result : FilePathProtocol
    
    __consuming func pushing(_ other: __owned FilePath) -> FilePath
    
    mutating func removePrefix<Prefix>(_ prefix: Prefix) -> Bool where Prefix : FilePathProtocol
    
    var filePath: FilePath { get }
    var string: String { get }
    
    var stem: String? { get }
    
    init(_ string: String)
    init(_ filePath: FilePath)
    
}

extension FilePathProtocol {
    
    // TODO: - Consider removing this imperative method
    // The updated path maintains its original type
    // even when it changes from referencing a directory to a file path
    //@available(*, deprecated)
    public mutating func append(_ other: FilePath.Component) {
        self = self.appending(other, resultType: Self.self)
    }
    
    public func pushing<Other, Result>(_ other: Other, resultType: Result.Type = Result.self)
        -> Result where Other : FilePathProtocol, Result : FilePathProtocol {
        let intermediateFilePath = self.pushing(other.filePath)
        return Result(intermediateFilePath)
    }
    
}


// MARK: - 

public extension FilePathProtocol {
    func relativeTo<Prefix>(prefix: Prefix) -> Self? where Prefix : FilePathProtocol {
        var relativePath = self
        return relativePath.removePrefix(prefix) ? relativePath : nil
    }
    
}


// MARK: - Combining components operators

public extension FilePathProtocol {
    static func +<Result>(lhs: Self, rhs: FilePath.Component) -> Result where Result : FilePathProtocol {
        lhs.appending(rhs, resultType: Result.self)
    }
    
    static func +<Result>(lhs: Self, rhs: String) -> Result where Result : FilePathProtocol {
        lhs.appending(rhs, resultType: Result.self)
    }
    
}
