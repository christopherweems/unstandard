//  NumberFormatter+Extensions.swift
//  Created by Christopher Weems on 2/9/21

import Foundation

public extension NumberFormatter {
    func callAsFunction<V>(_ value: V) -> String! where V : BinaryFloatingPoint {
        self.string(from: NSNumber(value: Double(value)))
    }
    
}

extension NumberFormatter {
    @_disfavoredOverload
    public func number<SP>(from string: SP) -> NSNumber? where SP : StringProtocol {
        self.number(from: String(string))
    }
    
}


public extension NumberFormatter {
    convenience init(_ configuration: (NumberFormatter) -> Void) {
        self.init()
        configuration(self)
    }
    
}
