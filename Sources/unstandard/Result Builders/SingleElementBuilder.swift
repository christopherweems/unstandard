//
//  SingleElementBuilder.swift
//  
//
//  Created by Christopher Weems on 3/26/20.
//

import Foundation

@_functionBuilder
public struct SingleElementBuilder<Element> {
    func buildBlock(_ element: Element) -> Element {
        element
    }
}
