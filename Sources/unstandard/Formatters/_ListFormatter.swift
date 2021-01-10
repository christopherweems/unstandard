//
//  _ListFormatter.swift
//  
//
//  Created by Christopher Weems on 1/10/21.
//

import Foundation

public class _ListFormatter {
    public class func localizedString(byJoining strings: [String]) -> String {
	#if !os(Linux)
        if #available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *) {
            return ListFormatter.localizedString(byJoining: strings)
        }
	#endif
        
        switch strings.count {
        case 0:
            return ""
            
        case 1:
            return strings[0]
            
        case 2:
            return strings[0...1].joined(separator: " & ")
            
        default:
            return strings.prefix(upTo: strings.lastIndex).joined(separator: ", ").appending(", & \(strings.last!)")
        }
    }
    
}
