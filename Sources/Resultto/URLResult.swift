//  URLResult.swift
//  10/4/21

#if canImport(Foundation)
import Foundation

@resultBuilder
public struct URLResult {
    public static func buildBlock(_ url: URL) -> URL {
        url
    }
   
    public static func buildEither(first component: URL) -> URL {
        component
    }
    
    public static func buildEither(second component: URL) -> URL {
        component
    }
    
}

extension URLResult {
    public static func buildExpression(_ urlString: String) -> URL {
        URL(string: urlString)!
    }
    
    public static func buildExpression(_ url: URL) -> URL {
        url
    }
    
}

#endif
