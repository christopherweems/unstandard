//
//  Binding+CGFloat.swift
//  
//
//  Created by Christopher Weems on 6/16/20.
//

import Foundation

public extension Binding where Value == CGFloat? {
    var isNil: Bool { wrappedValue == nil }
    
}
