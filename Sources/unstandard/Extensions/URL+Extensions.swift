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
