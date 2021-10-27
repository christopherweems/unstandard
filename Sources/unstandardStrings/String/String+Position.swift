//
//  String+Position.swift
//  
//
//  Created by Christopher Weems on 10/27/21.
//

import Foundation

extension String {
    public enum Position {
        case start
        case end
        
    }
    
}

extension StringProtocol {
    public typealias Position = String.Position
    
}
