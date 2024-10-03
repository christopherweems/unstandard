//  FileManager+Extensions.swift
//  9/8/21

import DirectoryPath
import Foundation
import SystemPackage

public extension FileManager {
    func contentsOfDirectory<ResultPath: FilePathProtocol>(
        _ directoryPath: DirectoryPath,
        resultType: ResultPath.Type = ResultPath.self
    ) throws -> [ResultPath] {
        #if !os(iOS) && !os(tvOS)
        let directoryPath = directoryPath.expandingTilde()
        #endif
        
        return try self.contentsOfDirectory(atPath: String(directoryPath.string.trimmingPrefix(#/file:/#)))
            .map { directoryPath.pushing(FilePath($0), resultType: ResultPath.self) }
    }
    
    func createDirectory(
        at directoryPath: DirectoryPath,
        withIntermediateDirectories createIntermediates: Bool,
        attributes: [FileAttributeKey : Any]? = nil
    ) throws {
        let directoryURL = URL(path: directoryPath)
        
        try self.createDirectory(at: directoryURL,
                             withIntermediateDirectories: createIntermediates,
                             attributes: attributes)
    }
    
    func fileExists(at path: some FilePathProtocol) -> Bool {
        return self.fileExists(atPath: path.filePath._path)
    }
    
}

extension FileManager {
    public func createFile(
        at filePath: FilePath,
        contents: Data?,
        attributes: [FileAttributeKey : Any]? = nil
    ) {
        self.createFile(atPath: filePath._path, contents: contents, attributes: attributes)
    }
    
}


// MARK: -

extension FileManager {
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func contentsOfDirectory(
        _ directory: DirectoryPath,
        withExtension extensionSuffix: String,
        includingResultsFromSubdirectories: Bool = false
    ) -> AsyncThrowingStream<FilePath, Error> {
        AsyncThrowingStream { continuation in
            do {
                for item in try self.contentsOfDirectory(directory, withExtension: extensionSuffix,
                                                         includingResultsFromSubdirectories: includingResultsFromSubdirectories) {
                    continuation.yield(item)
                }
                
            } catch let error {
                continuation.finish(throwing: error)
                
            }
            
            continuation.finish()
        }
    }
    
    // TODO: Refactor to use `enumerator(at:includingPropertiesForKeys:)`
    public func contentsOfDirectory(
        _ directory: DirectoryPath, withExtension extensionSuffix: String,
        includingResultsFromSubdirectories: Bool = false
    ) throws -> [FilePath] {
        let allContents = try self.contentsOfDirectory(directory)
        let contentsWithMatchingSuffix = allContents.filter(withSuffix: extensionSuffix)
        
        guard includingResultsFromSubdirectories else {
            return contentsWithMatchingSuffix
        }
        
        let subdirectories = allContents
            .filter {
                var isDirectory: ObjCBool = false
                _ = self.fileExists(atPath: $0.string, isDirectory: &isDirectory)
                return isDirectory.boolValue
            }
            .map(DirectoryPath.init)
        
        let subdirectoryContents = try subdirectories.flatMap {
            try self.contentsOfDirectory($0, withExtension: extensionSuffix, includingResultsFromSubdirectories: true)
        }
        
        return contentsWithMatchingSuffix + subdirectoryContents
    }
    
}

// MARK: - Removing files in a directory

extension FileManager {
    public func removeItems(in directoryPath: DirectoryPath) throws {
        for item in try self.contentsOfDirectory(directoryPath) {
            try self.removeItem(at: URL(filePath: item, isDirectory: false))
        }
    }
    
}

//

extension FileManager {
    public func attributesOfItem(
        at filePath: some FilePathProtocol
    ) throws -> [FileAttributeKey : Any] {
        try self.attributesOfItem(atPath: filePath.filePath._path)
    }
    
}

// MARK: - File Contents

extension FileManager {
    public func contents(of filePath: FilePath) async throws -> Data {
        return try await Task {
            guard let fileData = self.contents(atPath: filePath._path) else {
                throw CocoaError(.fileReadUnknown)
            }
            
            return fileData
        }.value
    }
    
}


// MARK: - Temporary Directory Path

extension FileManager {
    public var temporaryDirectoryPath: DirectoryPath {
        DirectoryPath(url: temporaryDirectory)
    }
    
}


// MARK: - Convenience methods

extension FileManager {
    // includes directory paths encoded as file paths
    public func contentsOfDirectory(_ directoryPath: DirectoryPath) throws -> [FilePath] {
        try self.contentsOfDirectory(directoryPath, resultType: FilePath.self)
    }
    
}


// MARK: - Temporary File

extension FileManager {
    @available(macOS 12.0, iOS 13.0, tvOS 13.0, *)
    public func temporaryFile(
        in directory: DirectoryPath,
        prefix: String = "TemporaryFile",
        suffix: String = "",
        deleteOnClose: Bool = true
    ) throws -> TemporaryFile {
        try .init(directory: directory, prefix: prefix, suffix: suffix, deleteOnClose: deleteOnClose)
    }
    
}


// MARK: - Deprecated methods

extension FileManager {
    @available(*, deprecated, renamed: "contentsOfDirectory(_:withExtension:includingResultsFromSubdirectories:)")
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func contentsOfDirectory(
        _ directory: DirectoryPath,
        withExtension extensionSuffix: String,
        includeResultsFromSubdirectories: Bool
    ) -> AsyncThrowingStream<FilePath, Error> {
        self.contentsOfDirectory(directory, withExtension: extensionSuffix, includingResultsFromSubdirectories: includeResultsFromSubdirectories)
    }
    
    @available(*, deprecated, renamed: "contentsOfDirectory(_:withExtension:includingResultsFromSubdirectories:)")
    public func contentsOfDirectory(
        _ directory: DirectoryPath,
        withExtension extensionSuffix: String,
        includeResultsFromSubdirectories: Bool
    ) throws -> [FilePath] {
        try self.contentsOfDirectory(directory, withExtension: extensionSuffix,
                                     includingResultsFromSubdirectories: includeResultsFromSubdirectories)
    }
    
}

extension FileManager: @unchecked Sendable { }
