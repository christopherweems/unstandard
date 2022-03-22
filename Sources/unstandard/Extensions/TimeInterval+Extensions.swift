//
//  TimeInterval+Extensions.swift
//
//
//  Created by Christopher Weems on 7/30/17.
//

import typealias Foundation.TimeInterval

extension TimeInterval {
    public init(minutes: Double) {
        self.init(minutes * 60)
    }
}
