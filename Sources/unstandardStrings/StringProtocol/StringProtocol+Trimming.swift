//
//  StringProtocol+Trimming.swift
//  
//
//  Created by Christopher Weems on 11/10/21.
//

extension StringProtocol {
    public func trimmingPrefix(while scanningPredicate: (Element, Element) throws -> Bool,
                        repeating repeatCount: Int = 1) rethrows -> SubSequence {
        var startIndex = startIndex
        var repeatCount = repeatCount
        
        while 0 < repeatCount {
            defer { repeatCount -= 1 }
            
            for (preceeding, following) in self[startIndex...].indexed().adjacentPairs() {
                if try scanningPredicate(preceeding.element, following.element) { continue }
                
                startIndex = following.index
            }
        }
        
        return self[startIndex...]
    }
    
}


// MARK: - Trim Methods

extension StringProtocol where SubSequence == Self {
    public mutating func trimFirst(_ count: Int = 1) {
        precondition(0 <= count)
        self = self.dropFirst(count)
    }
    
    // Returns `true` if any suffix was trimmed
    @discardableResult
    public mutating func trimSuffixStartingFrom(_ predicate: (Character) throws -> Bool) rethrows -> Bool {
        guard let firstDroppedIndex = try self.firstIndex(where: predicate) else { return false }
        self = self[..<firstDroppedIndex]
        return true
    }
    
}
