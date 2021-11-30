//
//  Task+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/16/21.
//

import Dispatch
import struct Foundation.TimeInterval

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension Task where Success == Never, Failure == Never {
    public static func sleep(_ sleepDuration: TimeInterval) async throws {
        let nanoseconds = UInt64(sleepDuration * 1_000_000_000)
        try await Task.sleep(nanoseconds: nanoseconds)
    }
    
}
