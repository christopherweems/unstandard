//
//  AsyncThrowingStream+Extensions.swift
//  
//
//  Created by Christopher Weems on 12/21/21.
//

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension AsyncThrowingStream where Failure == Swift.Error {
    public static func empty() -> Self {
        return .init(unfolding: { nil })
    }
    
}
