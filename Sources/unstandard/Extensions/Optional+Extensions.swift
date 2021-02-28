//  Optional+Extensions.swift
//  Created by Christopher Weems on 2/27/21

import Foundation

extension Optional {
    public init(if predicate: Bool, _ wrappedValue: () -> Wrapped) {
        switch predicate {
        case true:
            self = .some(wrappedValue())
            
        case false:
            self = .none
        }
    }
    
}
