//
//  Date+Extensions.swift
//
//
//  Created by Christopher Weems on 8/27/19.
//

import Foundation

public extension Date {
    @available(macOS, deprecated: 12.0, renamed: "now")
    @available(iOS, deprecated: 15.0, renamed: "now")
    @available(tvOS, deprecated: 15.0, renamed: "now")
    @available(watchOS, deprecated: 8.0, renamed: "now")
    static func now() -> Date {
        Date()
    }
    
}

