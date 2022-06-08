//
//  CharacterSet+SetDefinitions.swift
//  
//
//  Created by Christopher Weems on 11/4/21.
//

import Foundation
import lc_locale

extension CharacterSet {
    public static let hyphens: CharacterSet = {
        ["-"]
    }()
    
}

extension CharacterSet {
    public static func sentenceTerminatingPunctuation(in language: Locale.LCLanguage) -> Self {
        switch language {
        default:
            return .init(charactersIn: ".!?")
        }
    }
    
}
