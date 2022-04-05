//
//  String+Operators.swift
//
//
//  Created by Christopher Weems on 10/18/21.
//

extension String {
    public static func *(repeatedValue: String, count: Int) -> String {
        return .init(repeating: repeatedValue, count: count)
    }
    
    public static func *(count: Int, repeatedValue: String) -> String {
        return .init(repeating: repeatedValue, count: count)
    }
    
}
