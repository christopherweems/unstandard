//
//  StringProtocol+Indices.swift
//
//
//  Created by Christopher Weems on 9/27/21.
//

extension StringProtocol {
    public func index(_ indexKeyPath: KeyPath<Self, Index>, offsetBy offset: Int) -> Index {
        self.index(self[keyPath: indexKeyPath], offsetBy: offset)
    }
    
}

extension StringProtocol {
    public func index(of element: Character, from position: Position) -> Index? {
        switch position {
        case .start:
            return firstIndex(of: element)
            
        case .end:
            return lastIndex(of: element)
        }
    }
    
}
