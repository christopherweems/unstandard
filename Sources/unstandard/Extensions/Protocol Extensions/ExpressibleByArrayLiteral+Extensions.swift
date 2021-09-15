//
//  ExpressibleByArrayLiterla+Extensions.swift
//  
//
//  Created by Christopher Weems on 9/22/20.
//

import Foundation

extension ExpressibleByArrayLiteral {
    public init(@ArrayBuilder _ builder: () -> Self) {
        self = builder()
        
    }
    
}
