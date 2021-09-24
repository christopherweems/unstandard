//
//  AsyncLineSequence+Extensions.swift
//
//
//  Created by Christopher Weems on 9/24/21.
//

import Foundation

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
extension AsyncLineSequence {
    public func trimmingSingleLineComments(delimiter: String = "//")
    -> AsyncMapSequence<Self, String.SubSequence> {
        self.map { line in
            guard let commentStartIndex = line.range(of: delimiter)?.lowerBound else {
                return line.suffix(from: \.startIndex)
            }
            
            return line.prefix(upTo: commentStartIndex)
        }
    }
    
}
