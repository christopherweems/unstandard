//
//  StringProtocol+SetAlgebra.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

import Foundation

extension StringProtocol {
    public func contains(elementFrom characterSet: CharacterSet) -> Bool {
        unicodeScalars.contains(where: characterSet.contains)
    }
    
}
