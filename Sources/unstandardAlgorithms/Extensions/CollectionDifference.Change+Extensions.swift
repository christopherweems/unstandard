//
//  CollectionDifference.Change+Extensions.swift
//  
//
//  Created by Christopher Weems on 1/30/22.
//

@available(macOS 10.15, *)
@available(iOS 13, *)
@available(tvOS 13, *)
@available(watchOS 6, *)
extension CollectionDifference.Change {
    public var element: ChangeElement {
        switch self {
        case .insert(_, let element, _):
            return element
            
        case .remove(_, let element, _):
            return element
        }
    }
    
}
