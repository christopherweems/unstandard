//
//  String+Extensions.swift
//  
//
//  Created by Christopher Weems on 6/9/20.
//

import Foundation

public extension String {
    enum SpaceType: String {
        case hair = " "
        
    }
    
    static func space(_ spaceType: SpaceType) -> String {
        spaceType.rawValue
    }
}
