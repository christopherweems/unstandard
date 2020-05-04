//
//  SimpleArrayBuilder.swift
//  
//
//  Created by Christopher Weems on 3/21/20.
//

import Foundation

@_functionBuilder
public struct SimpleArrayBuilder<Element> {
    public static func buildBlock(_ contents: Element...) -> Array<Element> {
        Array<Element>(contents)
    }
    
    public static func buildBlock(_ singleElement: Element) -> Element {
        singleElement
    }
    
    public static func buildEither(first: Element) -> Element {
        first
    }
    
    public static func buildEither(second: Element) -> Element {
        second
    }
    
    public static func buildIf(_ singleElement: Element?) -> Array<Element> {
        guard let element = singleElement else { return [] }
        return [element]
    }
}
