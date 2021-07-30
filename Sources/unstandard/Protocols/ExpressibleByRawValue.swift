//  ExpressibleByRawValue.swift
//  Created by Christopher Weems on 3/16/21

public protocol ExpressibleByRawValue {
    associatedtype RawValue
    
    init?(rawValue: RawValue)
    
}


#if canImport(Foundation) && !os(Linux)

import Foundation

extension NetService.ErrorCode: ExpressibleByRawValue { }


#endif
