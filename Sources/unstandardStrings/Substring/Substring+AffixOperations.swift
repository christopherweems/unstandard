//
//  Substring+AffixOperations.swift
//
//
//  Created by Christopher Weems on 9/26/21.
//

extension Substring {
    public enum Direction {
        case forward
        case backward
        
    }
    
    public mutating func expand(_ direction: Direction, _ length: Int = 1) {
        switch direction {
        case .forward:
            let endIndex = base.index(endIndex, offsetBy: length)
            self = base[startIndex..<endIndex]
            
        case .backward:
            let startIndex = base.index(startIndex, offsetBy: -length)
            self = base[startIndex..<endIndex]
            
        }
    }
    
    public mutating func shorten(_ direction: Direction, _ length: Int = 1) {
        switch direction {
        case .forward:
            let startIndex = base.index(startIndex, offsetBy: length)
            self = base[startIndex..<endIndex]
            
        case .backward:
            let endIndex = base.index(endIndex, offsetBy: -length)
            self = base[startIndex..<endIndex]
            
        }
    }
    
}


extension Substring {
    public func droppingSuffix<S: StringProtocol>(_ suffix: S) -> Self? {
        guard self.hasSuffix(suffix) else { return nil }
        var new = self
        new.shorten(.backward, suffix.count)
        return new
    }
    
}
