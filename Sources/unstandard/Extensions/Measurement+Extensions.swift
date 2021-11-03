//
//  Measurement+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/3/21.
//

import Foundation

@available(macOS 10.12, iOS 10, tvOS 10, watchOS 3, *)
extension Measurement where UnitType : Dimension {
    public static var zero: Self {
        Measurement(value: .zero, unit: UnitType.baseUnit())
    }
    
}
