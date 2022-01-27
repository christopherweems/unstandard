//
//  Locale+Extensions.swift
//  
//
//  Created by Christopher Weems on 1/27/22.
//

import Foundation

extension Locale {
    public static var availableLocales: AvailableLocales {
        .init()
    }
    
}


extension Locale {
    public struct AvailableLocales: Sequence, IteratorProtocol {
        let identifiers: [String]
        var index: Array<String>.Index
        
        public mutating func next() -> Locale? {
            guard index != identifiers.endIndex else { return nil }
            let next = Locale(identifier: identifiers[index])
            index = identifiers.index(after: index)
            return next
        }
        
        fileprivate init() {
            identifiers = Locale.availableIdentifiers
            index = identifiers.startIndex
        }
    }
    
}
