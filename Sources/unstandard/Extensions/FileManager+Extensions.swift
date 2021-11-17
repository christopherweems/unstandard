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

@available(swift 5.5)
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension FileManager {
    public enum AsyncDocumentURLEnumerationError: Error {
        case invalidDocumentExtension
        
    }
    
    public func documentURLs(withExtension docExtension: String,
                             withinDirectoryAt directoryURL: URL,
                             includeDocumentsInSubdirectories: Bool = false) throws -> AsyncStream<URL> {
        guard !docExtension.hasPrefix(".") else {
            throw AsyncDocumentURLEnumerationError.invalidDocumentExtension
        }
        
        guard let directoryEnumerator = enumerator(at: directoryURL, includingPropertiesForKeys: []) else {
            throw CocoaError(.fileReadNoSuchFile)
        }
        
        return .init(URL.self) { continuation in
            for value in directoryEnumerator {
                let directoryURL = value as! URL
                
                if directoryURL.lastPathComponent.hasSuffix(".\(docExtension)") {
                    directoryEnumerator.skipDescendants()
                    continuation.yield(directoryURL)
                    
                }
                
                if !includeDocumentsInSubdirectories && directoryURL.hasDirectoryPath {
                    directoryEnumerator.skipDescendants()
                    
                }
                
            }
            
            continuation.finish()
            
        }
    }
    
}

