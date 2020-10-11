//
//  AnyTrue.swift
//  
//
//  Created by Christopher Weems on 10/11/20.
//

import Foundation

@_functionBuilder
public struct AnyTrue {
    public static func buildBlock(_ elements: Bool...) -> Bool {
        elements.lazy.contains(where: \.isTrue)
    }
    
}
