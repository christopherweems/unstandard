//
//  ByteCountFormatter.swift
//  
//
//  Created by Christopher Weems on 9/14/20.
//

import Foundation

extension ByteCountFormatter {
    public convenience init(allowedUnits: ByteCountFormatter.Units) {
        self.init()
        self.allowedUnits = allowedUnits
        
    }
    
}
