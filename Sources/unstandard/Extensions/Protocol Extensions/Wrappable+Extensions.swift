//
//  Wrappable+Extensions.swift
//  
//
//  Created by Christopher Weems on 4/2/21.
//

import Foundation

public extension Wrappable {
    func assertTrue(_ condition: (Self) -> Bool, _ message: @autoclosure () -> String = .init(),
                file: StaticString = #file, line: UInt = #line) -> Self {
        Swift.assert(condition(self), message())
        return self
    }
    
}
