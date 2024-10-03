//  FilePathProtocol+Extensions.swift
//  9/10/21

import SystemPackage
import DirectoryPath
import Foundation

// MARK: - `FilePath.init(url:)`

public extension FilePathProtocol {
    @inlinable
    init(url: URL) {
        self.init(url.path)
    }
    
}


// MARK: - Expanding Tilde Notation

@available(macOS 10.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
public extension FilePathProtocol {
    /* https://www.gnu.org/software/bash/manual/html_node/Tilde-Expansion.html */
    func expandingTilde() -> Self {
        let pathString = self.filePath._path
        
        guard pathString.hasPrefix("~") else { return self }
        let homeDirectory = FileManager.default.homeDirectoryForCurrentUser
        
        if pathString.hasPrefix("~/") {
            return .init(string.replacingOccurrences(of: "~", with: homeDirectory.path))
            
        } else {
            fatalError("Missing implementation")
            
        }
        
    }
    
}


// MARK: - Filtering Collections of `FilePathProtocol`

extension Collection where Element : FilePathProtocol {
    internal func filter(withSuffix extensionSuffix: String) -> [Element] {
        guard let dividerIndex = extensionSuffix.lastIndex(of: ".") else {
            return self.filter { $0.filePath.extension == extensionSuffix }
        }
        
        let fileExtensionStartIndex = extensionSuffix.index(after: dividerIndex)
        
        let fileSuffix = extensionSuffix.prefix(upTo: dividerIndex)
        let fileExtension = extensionSuffix.suffix(from: fileExtensionStartIndex)
        
        return self.filter {
            (fileExtension == $0.filePath.extension) && ($0.stem?.hasSuffix(fileSuffix) == true)
        }
    }
    
}
