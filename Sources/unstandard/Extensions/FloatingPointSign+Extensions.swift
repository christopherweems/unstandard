//
//  FloatingPointSign+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/12/21.
//

extension FloatingPointSign {
    public static func random<T>(using generator: inout T) -> Self where T : RandomNumberGenerator {
        Bool.random(using: &generator) ? .plus : .minus
    }
    
    public static func random() -> Self {
        var generator = SystemRandomNumberGenerator()
        return Self.random(using: &generator)
    }
    
}
