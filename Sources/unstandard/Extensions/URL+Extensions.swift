//
//  URL+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/30/17.
//

import Foundation

public extension URL {
    static var documentsURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    }
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value) ?? URL("")
    }
}


// MARK: - Operators

extension URL {
    public static func +(_ url: URL, pathComponent: String) -> URL {
        var isDirectory: Bool?
        
        var pathComponentStartIndex = pathComponent.startIndex
        var pathComponentEndIndex = pathComponent.endIndex
        
        var trimmedPathComponent: String {
            pathComponent[pathComponentStartIndex..<pathComponentEndIndex].asString()
        }
        
        if pathComponent.hasPrefix("/") {
            pathComponentStartIndex.increment(in: pathComponent)
            
        }
        
        if pathComponent.hasSuffix("/") {
            isDirectory = true
            pathComponentEndIndex.decrement(in: pathComponent)
            
        }
        
        switch isDirectory {
        case true:
            return url.appendingPathComponent(trimmedPathComponent, isDirectory: true)
            
        case _:
            return url.appendingPathComponent(trimmedPathComponent)
            
        }
    }
    
}
