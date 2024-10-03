//  TemporaryFile.swift
//  9/12/21
//
//  Adapted from defunct `TemporaryFile` class from `swift-package-manager`
//  (API & usage remains mostly the same)

import DirectoryPath
import SystemPackage
import Foundation

@available(macOS 12.0, *)
@available(iOS 13.0, *)
@available(tvOS 13.0, *)
public final class TemporaryFile {
    public enum Error: Swift.Error {
        case invalidFileName
        
    }
    
    /// The directory in which the temporary file is created.
    public let containerDirectory: DirectoryPath
    
    /// The full path of the temporary file. For safety file operations should be done via the fileHandle instead of
    /// using this path.
    public let path: FilePath
    
    /// FileHandle of the temporary file, can be used to read/write data.
    public let fileHandle: FileHandle
    
    /// Whether the file should be deleted on dealloc.
    public let deleteOnClose: Bool
    
    /// Creates an instance of Temporary file. The temporary file will live on disk until the instance
    /// goes out of scope.
    ///
    /// - Parameters:
    ///     - directory: If specified the temporary file will be created in this directory otherwise
    ///     the temporary directory for the current user will be used.
    ///     - prefix: The prefix to the temporary file name.
    ///     - suffix: The suffix to the temporary file name.
    ///     - deleteOnClose: Whether the file should get deleted when the instance is deallocated.
    ///
    /// - Throws: TemporaryFile.Error
    public init(directory: DirectoryPath? = nil, prefix: String = "TemporaryFile", suffix: String = "",
                deleteOnClose: Bool = true) throws {
        self.deleteOnClose = deleteOnClose
        
        // Determine in which directory to create the temporary file.
        self.containerDirectory = directory ?? DirectoryPath(url: FileManager.default.temporaryDirectory)
        
        // Construct path to the temporary file.
        guard let filepathStem = FilePath.Component(prefix + "." + UUID().uuidStringPrefix + suffix) else {
            throw Error.invalidFileName
        }
        
        path = self.containerDirectory.appending(filepathStem)
        
        FileManager.default.createFile(atPath: path.string, contents: nil, attributes: [:])
        fileHandle = try FileHandle(forWritingAtPath: path)
        
    }
    
    /// Remove the temporary file before deallocating.
    deinit {
        try? fileHandle.close()
        
        if deleteOnClose {
            try? FileManager.default.removeItem(at: URL(path: path))
            
        }
        
    }
    
}

extension FileHandle {
    convenience init(forWritingAtPath path: FilePath) throws {
        try self.init(forWritingTo: URL(path: path))
    }
    
}

@available(macOS 12.0, *)
@available(iOS 13.0, *)
@available(tvOS 13.0, *)
extension TemporaryFile: CustomStringConvertible {
    public var description: String {
        "<TemporaryFile: \(path)>"
    }
    
}


// MARK: - Helper Extensions

@available(macOS 10.15, *)
@available(iOS 13.0, *)
@available(tvOS 13.0, *)
fileprivate extension UUID {
    var uuidStringPrefix: some StringProtocol {
        uuidString.prefix(while: { $0 != "-" })
    }
    
}
