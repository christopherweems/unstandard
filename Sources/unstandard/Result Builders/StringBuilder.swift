//
//  StringBuilder.swift
//  
//
//  Created by Christopher Weems on 6/30/20.
//

import Foundation


/// Usage: see `unstandardTests.testStringBuilder()`


// MARK: - Separators

public protocol StringBuilderJoinSeparator {
    static var separator: String { get }
}

public struct NewLine: StringBuilderJoinSeparator {
    public static var separator: String { "\n" }
    
}

public struct Semicolon: StringBuilderJoinSeparator {
    public static var separator: String { ";" }
    
}

public struct SingleSpace: StringBuilderJoinSeparator {
    public static var separator: String { " " }
    
}

public struct EmptyJoin: StringBuilderJoinSeparator {
    public static var separator: String { "" }
    
}


// MARK: - StringBuilder

@resultBuilder
public struct StringBuilder<Join> where Join : StringBuilderJoinSeparator {
    public static func buildBlock() -> String {
        ""
    }
    
    public static func buildBlock(_ contents: String...) -> String {
        contents.joined(separator: Join.separator)
    }
    
    public static func buildOptional(_ contents: String?) -> String {
        contents ?? ""
    }
    
    public static func buildEither(first: String) -> String {
        first
    }
    
    public static func buildEither(second: String) -> String {
        second
    }
}
