//
//  SequenceInitializable.swift
//  
//
//  Created by Christopher Weems on 1/1/21.
//

public protocol SequenceInitializable {
    associatedtype Element
    init<S>(_ sequence: S) where S : Sequence, Self.Element == S.Element
    
}

extension Array : SequenceInitializable { }
extension Set : SequenceInitializable { }
