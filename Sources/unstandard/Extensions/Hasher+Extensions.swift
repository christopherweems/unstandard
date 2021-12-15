//
//  Hasher+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/12/21.
//

extension Hasher {
    public mutating func _combine(@HasherSet _ elements: () -> [AnyHashable]) {
        elements().forEach { element in
            self.combine(element)
        }
    }
    
}

@resultBuilder
public struct HasherSet {
    public static func buildBlock(_ components: [AnyHashable]...) -> [AnyHashable] {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: [AnyHashable]?) -> [AnyHashable] {
        component ?? []
    }
    
    public static func buildExpression<H: Hashable>(_ expression: H) -> [AnyHashable] {
        [AnyHashable(expression)]
    }
    
    public static func buildExpression<H1, H2>(_ expression: (H1, H2)) -> [AnyHashable] where H1: Hashable, H2: Hashable {
        [AnyHashable(expression.0), AnyHashable(expression.1)]
    }
    
}
