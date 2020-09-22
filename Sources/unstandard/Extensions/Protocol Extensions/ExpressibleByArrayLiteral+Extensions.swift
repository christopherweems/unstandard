//
//  ExpressibleByArrayLiterla+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/22/20.
//

import Foundation

public extension ExpressibleByArrayLiteral {
    init(@ArrayBuilder _ builder: () -> Self) {
        self = builder()
        
    }
    
}
