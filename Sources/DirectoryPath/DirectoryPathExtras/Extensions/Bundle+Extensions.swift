//
//  Bundle+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/10/22.
//

import DirectoryPath
import Foundation
import SystemPackage

extension Bundle {
    public func filePath(
        forResource name: String?,
        withExtension ext: String?
    ) -> FilePath? {
        guard let resourceURL = self.url(forResource: name, withExtension: ext) else {
            return nil
        }
        
        return .init(url: resourceURL)
    }
    
}
