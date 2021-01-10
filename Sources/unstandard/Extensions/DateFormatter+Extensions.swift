//
//  DateFormatter+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/19/20.
//

import Foundation

public extension DateFormatter {
    static func withConfiguration(_ configurationHandler: (DateFormatter) -> Void) -> DateFormatter {
        let new = DateFormatter()
        configurationHandler(new)
        return new
    }
    
    convenience init(_ configurationHandler: (DateFormatter) -> Void) {
        self.init()
        configurationHandler(self)
        
    }
    
}
