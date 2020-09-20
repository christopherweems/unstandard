//
//  DateFormatter+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/19/20.
//

import Foundation

public extension DateFormatter {
    static func withConfiguration(_ configurationHandler: (Self) -> Void) -> Self {
        let new = Self.init()
        configurationHandler(new)
        return new
    }
    
    
    convenience init(_ configurationHandler: (Self) -> Void) {
        self.init()
        configurationHandler(self)
    
    }
    
}
