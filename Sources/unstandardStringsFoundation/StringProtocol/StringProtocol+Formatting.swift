//
//  StringProtocol+Formatting.swift
//  
//
//  Created by Christopher Weems on 11/4/21.
//

//import unstandardCollections
//
//extension StringProtocol {
//    public func formatted(_ formatting: _StringFormatting) -> String {
//        let joinSeparator: String
//        var components: [String] = self.components(separatedBy: CharacterSet.whitespaces + "-")
//        guard !components.isEmpty else { return "" }
//        
//        switch formatting {
//        case .camelCase:
//            joinSeparator = ""
//            components.replace(at: \.startIndex, with: components.first!.lowercased())
//            components.replaceSubrange(\.tailRange) { $0.capitalized }
//            
//        case .hyphenated:
//            joinSeparator = "-"
//            components = components.map { $0.lowercased() }
//            
//        }
//        
//        return components.joined(separator: joinSeparator)
//    }
//    
//    
//}
//
//public enum _StringFormatting {
//    case camelCase
//    case hyphenated
//    
//}
