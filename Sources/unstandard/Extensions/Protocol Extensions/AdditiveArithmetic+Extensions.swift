//
//  AdditiveArithmetic+Extensions.swift
//  
//
//  Created by Christopher Weems on 10/29/21.
//


extension AdditiveArithmetic {
    public var nonZero: Self? {
        self != .zero ? self : nil
    }
    
}
