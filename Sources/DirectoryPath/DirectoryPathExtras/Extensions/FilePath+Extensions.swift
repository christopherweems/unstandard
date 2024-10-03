//
//  FilePath+Extensions.swift
//  
//
//  Created by Christopher Weems on 3/24/22.
//

import SystemPackage

extension FilePath {
    internal var _path: String {
        var path = string
        path.dropPrefix("file:")
        return path
    }
    
}

extension String {
    internal mutating func dropPrefix(_ prefix: String) {
        guard hasPrefix(prefix) else { return }
        self = String(suffix(from: index(startIndex, offsetBy: prefix.count)))
    }
    
}
