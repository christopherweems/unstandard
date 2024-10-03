//  URL+Extensions.swift
//  8/21/21

import DirectoryPath
import Foundation
import SystemPackage
@_exported import struct Foundation.URL

extension URL {
    public init(path filePath: FilePath, isDirectory: Bool = false) {
        var pathString = filePath._expandingTildeOnAvailablePlatforms()._path
        
        if isDirectory && !pathString.hasSuffix("/") {
            pathString.append("/")
            
        }
        
        self.init(fileURLWithPath: pathString)
    }
    
    public init(path: DirectoryPath) {
        self.init(path: path.filePath, isDirectory: true)
        
    }
    
}

extension FilePathProtocol {
    fileprivate func _expandingTildeOnAvailablePlatforms() -> Self {
        #if os(iOS) || os(tvOS)
        return self
        
        #else
        return self.expandingTilde()
        
        #endif
    }
    
}


// MARK: - Deprecated API

public extension URL {
    @available(*, deprecated, renamed: "init(path:isDirectory:)")
    init(filePath: FilePath, isDirectory: Bool = false) {
        self.init(path: filePath, isDirectory: isDirectory)
    }
    
}
