//
//  FileManager+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/19/21.
//

import Foundation

extension FileManager {
    public func byteCount(contentsOfDirectory directoryURL: URL) throws -> Int64 {
        guard directoryURL.isFileURL else {
            throw CocoaError(.fileReadInvalidFileName)
        }
        
        return try contentsOfDirectory(atPath: directoryURL.path)
            .map { directoryURL.appendingPathComponent($0, isDirectory: false) }
            .compactMap { try? (attributesOfItem(atPath: $0.path)[.size] as? NSNumber)?.int64Value }
            .reduce(.zero, +)
    }
    
}
