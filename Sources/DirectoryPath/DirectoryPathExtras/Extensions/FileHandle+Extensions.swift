//
//  FileHandle+Extensions.swift
//  
//
//  Created by Christopher Weems on 3/24/22.
//

import DirectoryPath
import Foundation
import SystemPackage

extension FileHandle {
    public convenience init(forUpdating filePath: some FilePathProtocol) throws {
        try self.init(forUpdating: URL(path: filePath.filePath))
    }
    
    public convenience init(forReadingFrom filePath: some FilePathProtocol) throws {
        try self.init(forReadingFrom: URL(path: filePath.filePath))
    }
    
    public convenience init(forWritingTo filePath: some FilePathProtocol) throws {
        try self.init(forWritingTo: URL(path: filePath.filePath))
    }
    
}
