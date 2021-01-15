//
//  SingleElementBuilder.swift
//  
//
//  Created by Christopher Weems on 3/26/20.
//

import Foundation

@available(*, deprecated)
@_functionBuilder
public struct SingleElementBuilder<Element> {
    public static func buildBlock(_ element: Element) -> Element {
        element
    }
    
}
