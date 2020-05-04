//
//  TimeInterval+Extensions.swift
//
//
//  Created by Christopher Weems on 7/30/17.
//

import Foundation

public extension TimeInterval {
    init(minutes: Double) {
        self.init(minutes * 60)
    }
}
