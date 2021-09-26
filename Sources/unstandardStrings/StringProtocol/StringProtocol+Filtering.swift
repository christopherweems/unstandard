//
//  StringProtocol+Filtering.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

import struct Foundation.CharacterSet


// MARK: - .filtered(by:)

extension StringProtocol {
    public func filtered(by filterSet: CharacterSet) -> String {
        self.unicodeScalars
            .filter(filterSet.contains)
            .map { String($0) }
            .joined()
    }
    
}


// MARK: - Stripping Characters

extension StringProtocol {
    public func stripping(charactersIn strippingSet: CharacterSet) -> String {
        String(self.filtered(by: strippingSet.inverted))
    }
    
}
