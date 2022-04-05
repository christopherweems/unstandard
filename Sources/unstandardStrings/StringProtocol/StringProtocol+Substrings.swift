//
//  StringProtocol+Substrings.swift
//  
//
//  Created by Christopher Weems on 12/27/21.
//

extension StringProtocol {
    public func substring(trimming lhs: String, _ rhs: String) -> SubSequence? {
        guard self.hasPrefix(lhs) else { return nil }
        guard self.hasSuffix(rhs) else { return nil }
        
        let startIndex = self.index(self.startIndex, offsetBy: lhs.count)
        let endIndex = self.index(self.endIndex, offsetBy: -rhs.count)
        guard startIndex < endIndex else { return nil }
        
        return self[startIndex..<endIndex]
    }
    
    public func substring(following preceeding: String) -> SubSequence? {
        guard self.hasSuffix(preceeding) else { return nil }
        let startIndex = index(self.startIndex, offsetBy: preceeding.count)
        return self[startIndex...]
    }
    
}
