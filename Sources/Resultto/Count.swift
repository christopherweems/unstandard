//  Count.swift
//  Created by Christopher Weems on 2/23/21

@resultBuilder
public struct Count {
    public static func buildBlock(_ elements: Bool...) -> Int {
        elements.reduce(0) { $0 + ($1 ? 1 : 0) }
    }
    
}
