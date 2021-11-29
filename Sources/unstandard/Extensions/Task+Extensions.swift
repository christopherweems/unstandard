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

@available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
extension Task where Failure == Never {
    public static func awaitDetached(priority: TaskPriority? = nil, operation: @escaping @Sendable () async -> Success) -> Success {
        let group = DispatchGroup()
        group.enter()
        
        let result = DetachedTaskResult<Success>()
        
        Task.detached(priority: .userInitiated) {
            result.value = await operation()
            group.leave()
            return result.value
        }
        
        group.wait()
        return result.value
    }
    
}


fileprivate class DetachedTaskResult<Result> {
    var value: Result! = nil
    var isComplete: Bool { value != nil }
    
}
