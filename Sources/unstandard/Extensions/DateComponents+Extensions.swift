//
//  DateComponents+Extensions.swift
//
//
//  Created by Christopher Weems on 10/19/21.
//

import Foundation

extension DateComponents {
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public static func now(_ calendarComponents: Calendar.Component..., in calendar: Calendar = .current) -> Self {
        calendar.dateComponents(Set(calendarComponents), from: .now)
    }
    
}
