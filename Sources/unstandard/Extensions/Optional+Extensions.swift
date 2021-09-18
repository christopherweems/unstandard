//  Optional+Extensions.swift
//  Created by Christopher Weems on 2/27/21

import Foundation


// MARK: -

extension Optional {
    // Toggles between nil and the active value each time the method is called
    public mutating func toggle(activeValue: Wrapped) where Wrapped : Equatable {
        switch self {
        case let .some(existing) where existing == activeValue:
            self = nil
            
        case .some:
            // the existing active value wasn't the same as the specified active value,
            // AMBIGUITY BREAKER: replace it instead of simply clearing it
            fallthrough
            
        case .none:
            self = activeValue
            
        }
    }
    
}


// MARK: -

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
